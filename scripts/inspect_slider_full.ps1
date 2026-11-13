$html = [System.IO.File]::ReadAllText('C:\Users\User\.gemini\antigravity\scratch\hoital-kristus-clinic\index.html', [System.Text.Encoding]::UTF8)

$pos = $html.IndexOf("specialties-slider")
Write-Output "specialties-slider at: $pos"

# Find next section or div after emergency
$emPos = $html.IndexOf("Emergency", $pos)
Write-Output "Emergency at: $emPos"

$afterEm = $html.Substring($emPos, [System.Math]::Min(2500, $html.Length - $emPos))
Write-Output $afterEm
