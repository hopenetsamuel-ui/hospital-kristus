$rawHtml = [System.IO.File]::ReadAllText("C:\Users\User\.gemini\antigravity\scratch\hoital-kristus-clinic\home_raw.html")

$bodyStart = $rawHtml.IndexOf("<body")
if ($bodyStart -ge 0) {
    Write-Output $rawHtml.Substring($bodyStart, [System.Math]::Min(3000, $rawHtml.Length - $bodyStart))
}
