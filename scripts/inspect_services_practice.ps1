$html = [System.IO.File]::ReadAllText('C:\Users\User\.gemini\antigravity\scratch\hoital-kristus-clinic\our-services.html', [System.Text.Encoding]::UTF8)

$pos = $html.IndexOf("practice-areas-section")
if ($pos -ge 0) {
    $start = [System.Math]::Max(0, $pos - 200)
    $len = [System.Math]::Min(1500, $html.Length - $start)
    Write-Output $html.Substring($start, $len)
} else {
    Write-Output "practice-areas-section not found in our-services.html"
}
