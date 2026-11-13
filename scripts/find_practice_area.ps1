$html = [System.IO.File]::ReadAllText('C:\Users\User\.gemini\antigravity\scratch\hoital-kristus-clinic\index.html', [System.Text.Encoding]::UTF8)

$matches = [regex]::Matches($html, '(?i)(practice area|expertise|practice-area)')
Write-Output "Found $($matches.Count) matches"
foreach ($m in $matches) {
    $pos = $m.Index
    $start = [System.Math]::Max(0, $pos - 150)
    $len = [System.Math]::Min(350, $html.Length - $start)
    Write-Output "Match at $pos : $($html.Substring($start, $len))"
    Write-Output "----------------------------------"
}
