$idx = [System.IO.File]::ReadAllText('C:\Users\User\.gemini\antigravity\scratch\hoital-kristus-clinic\index.html', [System.Text.Encoding]::UTF8)

$bodyPos = $idx.IndexOf('<body')
$firstHeroPos = $idx.IndexOf('class="hero', $bodyPos)
if ($firstHeroPos -lt 0) {
    $firstHeroPos = $idx.IndexOf('class="main-slider', $bodyPos)
}
Write-Output "body at $bodyPos, hero at $firstHeroPos"
Write-Output $idx.Substring($bodyPos, $firstHeroPos - $bodyPos)
