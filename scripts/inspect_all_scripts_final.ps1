$html = [System.IO.File]::ReadAllText('C:\Users\User\.gemini\antigravity\scratch\hoital-kristus-clinic\index.html', [System.Text.Encoding]::UTF8)

$matches = [regex]::Matches($html, '<script[^>]*>.*?</script>')
Write-Output "Found $($matches.Count) script tags"
foreach ($m in $matches) {
    Write-Output "--- SCRIPT ---"
    Write-Output $m.Value.Substring(0, [System.Math]::Min(300, $m.Value.Length))
}
