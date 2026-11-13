$html = [System.IO.File]::ReadAllText('C:\Users\User\.gemini\antigravity\scratch\hoital-kristus-clinic\index.html', [System.Text.Encoding]::UTF8)

$startPos = $html.IndexOf('<div class="specialties-section">')
$endPos = $html.IndexOf('<div class="facility-overview-section">')

Write-Output "Start: $startPos, End: $endPos, Total Length: $($endPos - $startPos)"
$snippet = $html.Substring($startPos, $endPos - $startPos)
# Write this snippet to a file to inspect
[System.IO.File]::WriteAllText('C:\Users\User\.gemini\antigravity\scratch\hoital-kristus-clinic\scripts\specialties_snippet.html', $snippet, [System.Text.Encoding]::UTF8)
Write-Output "Snippet written."
