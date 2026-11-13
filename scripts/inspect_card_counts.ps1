$idx = [System.IO.File]::ReadAllText('C:\Users\User\.gemini\antigravity\scratch\hoital-kristus-clinic\index.html', [System.Text.Encoding]::UTF8)

$matches = [regex]::Matches($idx, 'class="practice-card')
Write-Output "Total practice cards in file: $($matches.Count)"

foreach ($m in $matches) {
    $pos = $m.Index
    $titleMatch = [regex]::Match($idx.Substring($pos, [System.Math]::Min(300, $idx.Length - $pos)), 'class="practice-card-title">([^<]+)')
    Write-Output "Card at ${pos}: $($titleMatch.Groups[1].Value)"
}
