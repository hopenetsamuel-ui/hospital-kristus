$files = Get-ChildItem "C:\Users\User\.gemini\antigravity\scratch\hoital-kristus-clinic\*.html"
foreach ($f in $files) {
    $c = [System.IO.File]::ReadAllText($f.FullName, [System.Text.Encoding]::UTF8)
    $integMatches = [regex]::Matches($c, 'integrity="[^"]*"')
    Write-Output "$($f.Name): found $($integMatches.Count) integrity attributes"
}
