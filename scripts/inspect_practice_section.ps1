$html = [System.IO.File]::ReadAllText('C:\Users\User\.gemini\antigravity\scratch\hoital-kristus-clinic\index.html', [System.Text.Encoding]::UTF8)

$pos = $html.IndexOf("Our Practice Areas and Expertise")
$start = [System.Math]::Max(0, $pos - 400)
$len = [System.Math]::Min(3000, $html.Length - $start)
Write-Output $html.Substring($start, $len)
