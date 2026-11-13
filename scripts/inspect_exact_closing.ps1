$c = [System.IO.File]::ReadAllText("C:\Users\User\.gemini\antigravity\scratch\hoital-kristus-clinic\index.html", [System.Text.Encoding]::UTF8)

$spacerPos = $c.IndexOf('class="navbar-spacer"></div>')
$btnPos = $c.IndexOf('Book An Appointment', $spacerPos)
$closingPos = $c.IndexOf('</div></div></div>', $btnPos)

Write-Output "spacerPos: $spacerPos, btnPos: $btnPos, closingPos: $closingPos"
Write-Output "Length of duplicate block to remove: $($closingPos + 18 - ($spacerPos + 29))"
Write-Output "Snippet following closing:"
Write-Output $c.Substring($closingPos, 400)
