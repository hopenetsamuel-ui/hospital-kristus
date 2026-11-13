$content = [System.IO.File]::ReadAllText("C:\Users\User\.gemini\antigravity\scratch\hoital-kristus-clinic\scripts\savealife_home.html", [System.Text.Encoding]::UTF8)

$styleMatches = [regex]::Matches($content, '(?s)\.navbar[^{]*\{[^}]*\}')
for ($i = 10; $i -lt [System.Math]::Min(35, $styleMatches.Count); $i++) {
    Write-Output $styleMatches[$i].Value
}
