$files = Get-ChildItem "C:\Users\User\.gemini\antigravity\scratch\hoital-kristus-clinic\*.html"
foreach ($f in $files) {
    $c = [System.IO.File]::ReadAllText($f.FullName, [System.Text.Encoding]::UTF8)
    $bMatches = [regex]::Matches($c, '(?i)(webflow-badge|made in webflow|w-webflow)')
    if ($bMatches.Count -gt 0) {
        Write-Output "$($f.Name): found $($bMatches.Count) matches"
    }
}
