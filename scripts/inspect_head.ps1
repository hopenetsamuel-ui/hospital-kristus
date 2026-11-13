$html = [System.IO.File]::ReadAllText('C:\Users\User\.gemini\antigravity\scratch\hoital-kristus-clinic\index.html', [System.Text.Encoding]::UTF8)
$headStart = $html.IndexOf('<head')
$headEnd = $html.IndexOf('</head>')
Write-Output $html.Substring($headStart, $headEnd - $headStart + 7)
