$html = [System.IO.File]::ReadAllText("C:\Users\User\.gemini\antigravity\scratch\hoital-kristus-clinic\raw_pages\our-services.html")

$listStart = $html.IndexOf('<div role="list" class="practice-areas-list w-dyn-items">')
$cardiologyCount = [regex]::Matches($html, 'class="practice-card-title"').Count
Write-Output "Total service card titles: $cardiologyCount"

# Find the last practice-areas-item
$lastItemPos = $html.LastIndexOf('class="practice-areas-item w-dyn-item"')
Write-Output "Last item pos: $lastItemPos"
$endPos = $html.IndexOf('</div>', $lastItemPos + 500)
Write-Output "End block: $($html.Substring($lastItemPos, [System.Math]::Min(1500, $html.Length - $lastItemPos)))"
