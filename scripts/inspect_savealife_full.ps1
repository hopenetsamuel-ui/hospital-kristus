$header = [System.IO.File]::ReadAllText("C:\Users\User\.gemini\antigravity\scratch\hoital-kristus-clinic\scripts\savealife_header.html", [System.Text.Encoding]::UTF8)
Write-Output "--- FULL SAVEALIFE HEADER ---"
Write-Output $header

# Check if there is a top-bar or announcement bar above header in savealife_home.html
$home = [System.IO.File]::ReadAllText("C:\Users\User\.gemini\antigravity\scratch\hoital-kristus-clinic\scripts\savealife_home.html", [System.Text.Encoding]::UTF8)
$headerPos = $home.IndexOf('<header')
if ($headerPos -gt 0) {
    Write-Output "--- BEFORE HEADER (TOP BAR?) ---"
    $topSnippet = $home.Substring([System.Math]::Max(0, $headerPos - 2000), [System.Math]::Min(2000, $headerPos))
    Write-Output $topSnippet
}
