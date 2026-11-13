$ErrorActionPreference = "SilentlyContinue"
$baseUrl = "https://fycare.webflow.io"
$home = Invoke-WebRequest -Uri $baseUrl -UseBasicParsing
$homeHtml = $home.Content

# Find all links
$links = [regex]::Matches($homeHtml, 'href="([^"#\?]+)"') | ForEach-Object { $_.Groups[1].Value } | Sort-Object -Unique
Write-Output "=== LINKS IN HOMEPAGE ==="
$links | Where-Object { $_ -match "^/" -or $_ -match "fycare" }

# Find CSS
$css = [regex]::Matches($homeHtml, '<link[^>]+href="([^">]+\.css[^"]*)"') | ForEach-Object { $_.Groups[1].Value }
Write-Output "=== CSS FILES ==="
$css

# Find JS
$scripts = [regex]::Matches($homeHtml, '<script[^>]+src="([^">]+)"') | ForEach-Object { $_.Groups[1].Value }
Write-Output "=== JS FILES ==="
$scripts

# Find Fonts
$fonts = [regex]::Matches($homeHtml, 'fonts\.(googleapis|gstatic)\.com[^\s"''<>]+') | ForEach-Object { $_.Value } | Sort-Object -Unique
Write-Output "=== GOOGLE FONTS ==="
$fonts
