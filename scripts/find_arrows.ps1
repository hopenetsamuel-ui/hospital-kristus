$html = [System.IO.File]::ReadAllText('C:\Users\User\.gemini\antigravity\scratch\hoital-kristus-clinic\raw_pages\index.html', [System.Text.Encoding]::UTF8)

$matches = [regex]::Matches($html, '(?s)<div[^>]+class="[^"]*arrow[^"]*"[^>]*>.*?</div>')
Write-Output "Found $($matches.Count) arrow matches"
foreach ($m in $matches) {
    Write-Output $m.Value
    Write-Output "---"
}
