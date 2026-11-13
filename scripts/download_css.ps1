$cssUrl = "https://cdn.prod.website-files.com/6a6b05680d42218e36607649/css/fycare.webflow.shared.799958974.css"
$resp = Invoke-WebRequest -Uri $cssUrl -UseBasicParsing -UserAgent "Mozilla/5.0"
$cssContent = $resp.Content

$outDir = "C:\Users\User\.gemini\antigravity\scratch\hoital-kristus-clinic\css"
if (!(Test-Path $outDir)) { New-Item -ItemType Directory -Path $outDir -Force }
[System.IO.File]::WriteAllText("$outDir\webflow-style.css", $cssContent, [System.Text.Encoding]::UTF8)

Write-Output "Downloaded webflow-style.css, size: $($cssContent.Length) bytes"

$pattern = 'url\(([^)]+)\)'
$urlsInCss = [regex]::Matches($cssContent, $pattern) | ForEach-Object { 
    $_.Groups[1].Value.Trim("'`"") 
} | Select-Object -Unique

Write-Output "Found $($urlsInCss.Count) URLs in CSS file"
$urlsInCss | Select-Object -First 20
