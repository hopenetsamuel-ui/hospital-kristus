$html = [System.IO.File]::ReadAllText("C:\Users\User\.gemini\antigravity\scratch\hoital-kristus-clinic\raw_pages\our-services.html")

$listStart = $html.IndexOf('<div role="list" class="practice-areas-list w-dyn-items">')
$nextDynList = $html.IndexOf('</div></div>', $listStart + 100)
Write-Output "Found list start at $listStart, dyn items block len: $($html.IndexOf('</div><div class="w-pagination-wrapper', $listStart) - $listStart)"
