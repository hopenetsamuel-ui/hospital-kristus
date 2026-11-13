$html = [System.IO.File]::ReadAllText("C:\Users\User\.gemini\antigravity\scratch\hoital-kristus-clinic\raw_pages\our-services.html")

$pos = $html.IndexOf('class="practice-button')
if ($pos -ge 0) {
    Write-Output $html.Substring($pos, 400)
}
