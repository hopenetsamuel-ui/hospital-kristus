$idx = [System.IO.File]::ReadAllText("C:\Users\User\.gemini\antigravity\scratch\hoital-kristus-clinic\index.html", [System.Text.Encoding]::UTF8)

$navStart = $idx.IndexOf('<header class="navbar"')
$navEnd = $idx.IndexOf('</header>') + 9

Write-Output $idx.Substring($navStart, $navEnd - $navStart)
