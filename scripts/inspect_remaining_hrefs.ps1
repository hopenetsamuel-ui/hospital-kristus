$content = [System.IO.File]::ReadAllText("C:\Users\User\.gemini\antigravity\scratch\hoital-kristus-clinic\index.html")
$matches = [regex]::Matches($content, 'href=["''][^"'']*fycare[^"'']*["'']')
foreach ($m in $matches) {
    Write-Output $m.Value
}
