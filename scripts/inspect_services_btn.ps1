$html = [System.IO.File]::ReadAllText('C:\Users\User\.gemini\antigravity\scratch\hoital-kristus-clinic\index.html', [System.Text.Encoding]::UTF8)

$srvPos = $html.IndexOf('<a href="our-services.html" class="practice-button w-inline-block"')
if ($srvPos -ge 0) {
    Write-Output "Before our-services button:"
    Write-Output $html.Substring($srvPos - 200, 400)
}
