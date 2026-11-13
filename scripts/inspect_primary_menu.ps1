$c = [System.IO.File]::ReadAllText("C:\Users\User\.gemini\antigravity\scratch\hoital-kristus-clinic\index.html", [System.Text.Encoding]::UTF8)

$matches = [regex]::Matches($c, 'primary-menu')
Write-Output "Found $($matches.Count) matches in index.html"
foreach ($m in $matches) {
    $pos = $m.Index
    $start = [System.Math]::Max(0, $pos - 200)
    $len = [System.Math]::Min(500, $c.Length - $start)
    Write-Output "At position ${pos}:"
    Write-Output $c.Substring($start, $len)
    Write-Output "--------------------------------------------------"
}
