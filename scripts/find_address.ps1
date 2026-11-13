$files = Get-ChildItem "C:\Users\User\.gemini\antigravity\scratch\hoital-kristus-clinic\raw_pages\*.html"
foreach ($f in $files) {
    $content = [System.IO.File]::ReadAllText($f.FullName)
    $matches = [regex]::Matches($content, '(?i)(Lexington|Suite 502|New York|NY 100|Ave, NY)')
    if ($matches.Count -gt 0) {
        Write-Output "$($f.Name): found $($matches.Count) address references"
    }
}
