$baseUrl = "https://fycare.webflow.io"
$resp = Invoke-WebRequest -Uri $baseUrl -UseBasicParsing -UserAgent "Mozilla/5.0"
$rawHtml = $resp.Content

[System.IO.File]::WriteAllText("C:\Users\User\.gemini\antigravity\scratch\hoital-kristus-clinic\home_raw.html", $rawHtml, [System.Text.Encoding]::UTF8)
Write-Output "Saved home_raw.html, size: $($rawHtml.Length)"

# Also let's extract links
$matches = [regex]::Matches($rawHtml, 'href=["'']([^"'']+)["'']')
$pageLinks = @()
foreach ($m in $matches) {
    $v = $m.Groups[1].Value
    if ($v -match '^/' -or $v -match 'fycare') {
        $pageLinks += $v
    }
}
Write-Output "=== UNIQUE LINKS ==="
$pageLinks | Select-Object -Unique
