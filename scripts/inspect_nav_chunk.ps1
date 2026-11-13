$rawHtml = [System.IO.File]::ReadAllText("C:\Users\User\.gemini\antigravity\scratch\hoital-kristus-clinic\home_raw.html")

$navPos = $rawHtml.IndexOf('data-collapse="medium"')
if ($navPos -ge 0) {
    Write-Output $rawHtml.Substring($navPos, 2000)
} else {
    Write-Output "Not found data-collapse"
}
