Add-Type -AssemblyName System.Net.Http

$json = Get-Content "C:\Users\User\.gemini\antigravity\scratch\hoital-kristus-clinic\assets_list.json" -Raw | ConvertFrom-Json
$images = $json.images

$imgDir = "C:\Users\User\.gemini\antigravity\scratch\hoital-kristus-clinic\images"
if (!(Test-Path $imgDir)) { New-Item -ItemType Directory -Path $imgDir -Force }

$client = [System.Net.Http.HttpClient]::new()
$client.DefaultRequestHeaders.Add("User-Agent", "Mozilla/5.0")

$urlToLocalMap = [System.Collections.Concurrent.ConcurrentDictionary[string, string]]::new()

$tasks = [System.Collections.Generic.List[System.Threading.Tasks.Task]]::new()

$i = 0
foreach ($url in $images) {
    $i++
    if ([string]::IsNullOrWhiteSpace($url) -or $url -match '^data:') { continue }
    
    try {
        $uri = [System.Uri]$url
        $filename = [System.IO.Path]::GetFileName($uri.AbsolutePath)
        if ([string]::IsNullOrWhiteSpace($filename)) {
            $filename = "img_$i.jpg"
        }
        $filename = $filename -replace '[^\w\.\-]', '_'
        $dest = Join-Path $imgDir $filename
        
        $urlToLocalMap[$url] = "images/$filename"
        
        if (!(Test-Path $dest)) {
            $task = [System.Threading.Tasks.Task]::Run([Action]{
                try {
                    $bytes = $client.GetByteArrayAsync($url).GetAwaiter().GetResult()
                    [System.IO.File]::WriteAllBytes($dest, $bytes)
                } catch {}
            })
            $tasks.Add($task)
        }
    } catch {}
}

Write-Output "Waiting for $($tasks.Count) download tasks..."
[System.Threading.Tasks.Task]::WaitAll($tasks.ToArray())
Write-Output "Finished downloading images. Total in map: $($urlToLocalMap.Count)"

$hashtable = @{}
foreach ($pair in $urlToLocalMap) {
    $hashtable[$pair.Key] = $pair.Value
}
$hashtable | ConvertTo-Json -Depth 2 | Out-File "C:\Users\User\.gemini\antigravity\scratch\hoital-kristus-clinic\url_to_local_map.json" -Encoding utf8
