$html = [System.IO.File]::ReadAllText('C:\Users\User\.gemini\antigravity\scratch\hoital-kristus-clinic\our-services.html', [System.Text.Encoding]::UTF8)

$startPos = $html.IndexOf('<div class="practice-areas-section">')
$endPos = $html.IndexOf('<div class="space-150px">', $startPos)
Write-Output "In our-services.html: start $startPos, end $endPos, len $($endPos - $startPos)"
