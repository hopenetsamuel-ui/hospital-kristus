$html = [System.IO.File]::ReadAllText("C:\Users\User\.gemini\antigravity\scratch\hoital-kristus-clinic\raw_pages\our-services.html")

$pos = $html.IndexOf('Ophthalmology')
$after = $html.Substring($pos, 2500)
Write-Output $after
