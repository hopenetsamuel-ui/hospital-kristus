$jsDir = "C:\Users\User\.gemini\antigravity\scratch\hoital-kristus-clinic\js"
$cssDir = "C:\Users\User\.gemini\antigravity\scratch\hoital-kristus-clinic\css"

if (!(Test-Path $jsDir)) { New-Item -ItemType Directory -Path $jsDir -Force }
if (!(Test-Path $cssDir)) { New-Item -ItemType Directory -Path $cssDir -Force }

# Download Bootstrap 5.3.3 CSS and JS
Write-Output "Downloading Bootstrap..."
Invoke-WebRequest -Uri "https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" -OutFile "$cssDir\bootstrap.min.css" -UseBasicParsing
Invoke-WebRequest -Uri "https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" -OutFile "$jsDir\bootstrap.bundle.min.js" -UseBasicParsing

# Download Bootstrap Icons
Invoke-WebRequest -Uri "https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" -OutFile "$cssDir\bootstrap-icons.min.css" -UseBasicParsing

# Download JS assets from assets_list
$json = Get-Content "C:\Users\User\.gemini\antigravity\scratch\hoital-kristus-clinic\assets_list.json" -Raw | ConvertFrom-Json
$scripts = $json.js

$jsMap = @{}

foreach ($url in $scripts) {
    if ([string]::IsNullOrWhiteSpace($url)) { continue }
    try {
        $uri = [System.Uri]$url
        $filename = [System.IO.Path]::GetFileName($uri.AbsolutePath)
        if ($filename -match '\.js') {
            # clean filename
            $cleanName = $filename -replace '[^\w\.\-]', '_'
            $dest = Join-Path $jsDir $cleanName
            $jsMap[$url] = "js/$cleanName"
            if (!(Test-Path $dest)) {
                Invoke-WebRequest -Uri $url -OutFile $dest -UseBasicParsing -UserAgent "Mozilla/5.0"
            }
        }
    } catch {
        Write-Output "Failed js: $url"
    }
}

$jsMap | ConvertTo-Json -Depth 2 | Out-File "C:\Users\User\.gemini\antigravity\scratch\hoital-kristus-clinic\js_to_local_map.json" -Encoding utf8
Write-Output "Downloaded JS assets."
