$rawHtml = [System.IO.File]::ReadAllText("C:\Users\User\.gemini\antigravity\scratch\hoital-kristus-clinic\home_raw.html")

$navSearch = [regex]::Matches($rawHtml, '(?s)<div[^>]*class="[^"]*nav-menu[^"]*"[^>]*>[\s\S]*?</nav>')
foreach ($m in $navSearch) {
    Write-Output "--- NAV MENU ---"
    Write-Output $m.Value
}
