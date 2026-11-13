$html = [System.IO.File]::ReadAllText('C:\Users\User\.gemini\antigravity\scratch\hoital-kristus-clinic\index.html', [System.Text.Encoding]::UTF8)

$pos = $html.IndexOf("specialties-slider")
$start = [System.Math]::Max(0, $pos)
$len = [System.Math]::Min(3500, $html.Length - $start)
$snippet = $html.Substring($start, $len)

# Find where the slider ends (look for left-arrow or right-arrow or space- after slider)
$arrowPos = $snippet.IndexOf("w-slider-arrow-right")
if ($arrowPos -ge 0) {
    Write-Output $snippet.Substring($arrowPos - 200, 800)
} else {
    Write-Output "arrow not found in snippet"
}
