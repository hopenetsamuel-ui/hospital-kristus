$servicesHtml = [System.IO.File]::ReadAllText("C:\Users\User\.gemini\antigravity\scratch\hoital-kristus-clinic\raw_pages\our-services.html")

$serviceMatches = [regex]::Matches($servicesHtml, '(?s)<div[^>]*class="[^"]*service[^"]*"[^>]*>.*?</div>')
Write-Output "Found $($serviceMatches.Count) matches"
for ($i = 0; $i -lt [System.Math]::Min(5, $serviceMatches.Count); $i++) {
    Write-Output "--- SERVICE ITEM $i ---"
    Write-Output $serviceMatches[$i].Value.Substring(0, [System.Math]::Min(500, $serviceMatches[$i].Value.Length))
}
