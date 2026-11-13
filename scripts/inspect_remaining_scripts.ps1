$rawHtml = [System.IO.File]::ReadAllText("C:\Users\User\.gemini\antigravity\scratch\hoital-kristus-clinic\home_raw.html")

$scriptBlocks = [regex]::Matches($rawHtml, '<script([^>]*)>([\s\S]*?)</script>')
for ($i = 5; $i -lt $scriptBlocks.Count; $i++) {
    $sb = $scriptBlocks[$i]
    $attr = $sb.Groups[1].Value
    $body = $sb.Groups[2].Value.Trim()
    Write-Output "[$i] ATTR: $attr"
    Write-Output "BODY: $body"
    Write-Output "-----------------------------------"
}
