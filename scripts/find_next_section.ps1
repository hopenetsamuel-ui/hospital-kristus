$html = [System.IO.File]::ReadAllText('C:\Users\User\.gemini\antigravity\scratch\hoital-kristus-clinic\index.html', [System.Text.Encoding]::UTF8)

$startPos = $html.IndexOf('<div class="specialties-section">')

# Search for the next section after startPos
$matches = [regex]::Matches($html.Substring($startPos), '<div[^>]+class="[^"]*section[^"]*"')
Write-Output "Sections after specialties:"
foreach ($m in $matches) {
    Write-Output $m.Value
}
