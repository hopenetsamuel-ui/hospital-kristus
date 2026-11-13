# Inspect CSS rules affecting .navbar, .container, .navbar__inner
$custom = [System.IO.File]::ReadAllText("C:\Users\User\.gemini\antigravity\scratch\hoital-kristus-clinic\css\custom.css", [System.Text.Encoding]::UTF8)
$webflow = [System.IO.File]::ReadAllText("C:\Users\User\.gemini\antigravity\scratch\hoital-kristus-clinic\css\webflow-style.css", [System.Text.Encoding]::UTF8)

# Check if .navbar or .container has rules in webflow
$wNavbar = [regex]::Matches($webflow, '(?s)\.navbar\b[^{]*\{[^}]*\}')
Write-Output "Webflow .navbar rules count: $($wNavbar.Count)"
foreach ($m in $wNavbar) { Write-Output $m.Value }

$wContainer = [regex]::Matches($webflow, '(?s)\.container\b[^{]*\{[^}]*\}')
Write-Output "Webflow .container rules count: $($wContainer.Count)"
foreach ($m in $wContainer) { Write-Output $m.Value }
