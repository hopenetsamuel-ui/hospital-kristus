$c = [System.IO.File]::ReadAllText("C:\Users\User\.gemini\antigravity\scratch\hoital-kristus-clinic\index.html", [System.Text.Encoding]::UTF8)

$navPos = $c.IndexOf('id="siteNavbar"')
$nextPos = $c.IndexOf('class="page-title', $navPos)
if ($nextPos -lt 0) {
    $nextPos = $c.IndexOf('class="home-paralax', $navPos)
}
Write-Output "navPos: $navPos, nextPos: $nextPos, Length: $($nextPos - $navPos)"
Write-Output $c.Substring($navPos, $nextPos - $navPos)
