$rawHtml = [System.IO.File]::ReadAllText("C:\Users\User\.gemini\antigravity\scratch\hoital-kristus-clinic\home_raw.html")

$scriptBlocks = [regex]::Matches($rawHtml, '<script([^>]*)>([\s\S]*?)</script>')
Write-Output "Found $($scriptBlocks.Count) script tags"
foreach ($sb in $scriptBlocks) {
    $attr = $sb.Groups[1].Value
    $body = $sb.Groups[2].Value.Trim()
    if ($body.Length -gt 0) {
        Write-Output "ATTR: $attr"
        Write-Output "BODY: $body"
        Write-Output "-----------------------------------"
    }
}
