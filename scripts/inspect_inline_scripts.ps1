$rawHtml = [System.IO.File]::ReadAllText("C:\Users\User\.gemini\antigravity\scratch\hoital-kristus-clinic\home_raw.html")

$scriptBlocks = [regex]::Matches($rawHtml, '<script>([\s\S]*?)</script>')
Write-Output "Found $($scriptBlocks.Count) inline script blocks"
foreach ($sb in $scriptBlocks) {
    Write-Output "--- INLINE SCRIPT ---"
    Write-Output $sb.Groups[1].Value.Substring(0, [System.Math]::Min(500, $sb.Groups[1].Value.Length))
}
