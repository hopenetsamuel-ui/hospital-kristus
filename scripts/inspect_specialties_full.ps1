$html = [System.IO.File]::ReadAllText('C:\Users\User\.gemini\antigravity\scratch\hoital-kristus-clinic\index.html', [System.Text.Encoding]::UTF8)

$startPos = $html.IndexOf('<div class="specialties-section">')
$nextSecPos = $html.IndexOf('class="why-choose-us', $startPos)
if ($nextSecPos -lt 0) {
    $nextSecPos = $html.IndexOf('class="space-150px', $startPos + 500)
}
Write-Output "Section start: $startPos, end approx: $nextSecPos"
Write-Output "Length: $($nextSecPos - $startPos)"
Write-Output $html.Substring($startPos, [System.Math]::Min(1500, $nextSecPos - $startPos))
