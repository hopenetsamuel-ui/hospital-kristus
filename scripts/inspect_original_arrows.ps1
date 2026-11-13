$html = [System.IO.File]::ReadAllText('C:\Users\User\.gemini\antigravity\scratch\hoital-kristus-clinic\raw_pages\index.html', [System.Text.Encoding]::UTF8)

$pos = $html.IndexOf('class="left-arrow')
if ($pos -ge 0) {
    Write-Output "Left arrow found at ${pos}:"
    Write-Output $html.Substring($pos - 50, 600)
}

$dotPos = $html.IndexOf('class="slide-nav')
if ($dotPos -ge 0) {
    Write-Output "Slide nav found at ${dotPos}:"
    Write-Output $html.Substring($dotPos - 50, 400)
}
