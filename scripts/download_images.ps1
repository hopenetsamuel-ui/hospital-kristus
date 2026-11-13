$json = Get-Content "C:\Users\User\.gemini\antigravity\scratch\hoital-kristus-clinic\assets_list.json" -Raw | ConvertFrom-Json
$images = $json.images

$imgDir = "C:\Users\User\.gemini\antigravity\scratch\hoital-kristus-clinic\images"
if (!(Test-Path $imgDir)) { New-Item -ItemType Directory -Path $imgDir -Force }

$urlToLocalMap = @{}

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
            Invoke-WebRequest -Uri $url -OutFile $dest -UseBasicParsing -UserAgent "Mozilla/5.0"
        }
    } catch {
        Write-Output "Failed: $url"
    }
}

Write-Output "Downloaded images. Total mapped: $($urlToLocalMap.Count)"
$urlToLocalMap | ConvertTo-Json -Depth 2 | Out-File "C:\Users\User\.gemini\antigravity\scratch\hoital-kristus-clinic\url_to_local_map.json" -Encoding utf8
