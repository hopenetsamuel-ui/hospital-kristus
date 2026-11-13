$rawHtml = [System.IO.File]::ReadAllText("C:\Users\User\.gemini\antigravity\scratch\hoital-kristus-clinic\home_raw.html")

$navMatch = [regex]::Match($rawHtml, '(?s)<nav[^>]*>.*?</nav>')
if ($navMatch.Success) {
    Write-Output $navMatch.Value
} else {
    # Check for header or w-nav
    $headerMatch = [regex]::Match($rawHtml, '(?s)<div[^>]*class="[^"]*nav[^"]*"[^>]*>.*?</div>')
    Write-Output "Header match: $($headerMatch.Value.Substring(0, [System.Math]::Min(1000, $headerMatch.Value.Length)))"
}
