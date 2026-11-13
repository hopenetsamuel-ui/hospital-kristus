$rawHtml = [System.IO.File]::ReadAllText("C:\Users\User\.gemini\antigravity\scratch\hoital-kristus-clinic\home_raw.html")

$pos = 0
while (($pos = $rawHtml.IndexOf("<nav", $pos, [System.StringComparison]::OrdinalIgnoreCase)) -ge 0) {
    Write-Output "Found <nav at pos ${pos}:"
    Write-Output $rawHtml.Substring($pos, [System.Math]::Min(300, $rawHtml.Length - $pos))
    Write-Output "-------------------------"
    $pos += 4
}
