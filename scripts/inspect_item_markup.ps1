$html = [System.IO.File]::ReadAllText("C:\Users\User\.gemini\antigravity\scratch\hoital-kristus-clinic\raw_pages\our-services.html")

$start = $html.IndexOf('<div role="list" class="practice-areas-list w-dyn-items">')
if ($start -ge 0) {
    # Find one listitem
    $itemStart = $html.IndexOf('<div role="listitem"', $start)
    $itemEnd = $html.IndexOf('</div></div></div>', $itemStart)
    Write-Output "--- SINGLE ITEM HTML ---"
    Write-Output $html.Substring($itemStart, 1200)
}
