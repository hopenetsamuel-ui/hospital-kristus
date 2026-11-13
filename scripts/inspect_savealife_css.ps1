$content = [System.IO.File]::ReadAllText("C:\Users\User\.gemini\antigravity\scratch\hoital-kristus-clinic\scripts\savealife_home.html", [System.Text.Encoding]::UTF8)

# Find CSS links
$cssMatches = [regex]::Matches($content, '<link[^>]+rel="stylesheet"[^>]*>')
Write-Output "CSS links:"
foreach ($c in $cssMatches) {
    Write-Output $c.Value
}

# Find inline styles related to navbar
$styleMatches = [regex]::Matches($content, '(?s)\.navbar[^{]*\{[^}]*\}')
Write-Output "Navbar CSS rules count: $($styleMatches.Count)"
$styleMatches | Select-Object -First 10 | ForEach-Object { Write-Output $_.Value }
