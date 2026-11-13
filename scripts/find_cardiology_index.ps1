$indexHtml = [System.IO.File]::ReadAllText("C:\Users\User\.gemini\antigravity\scratch\hoital-kristus-clinic\raw_pages\index.html")

$pos = $indexHtml.IndexOf("Cardiology")
if ($pos -ge 0) {
    Write-Output "Found Cardiology in index.html at ${pos}:"
    $start = [System.Math]::Max(0, $pos - 300)
    $len = [System.Math]::Min(1200, $indexHtml.Length - $start)
    Write-Output $indexHtml.Substring($start, $len)
} else {
    Write-Output "Cardiology not found in index.html"
}
