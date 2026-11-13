$files = Get-ChildItem "C:\Users\User\.gemini\antigravity\scratch\hoital-kristus-clinic\raw_pages\*.html"
foreach ($f in $files) {
    $content = [System.IO.File]::ReadAllText($f.FullName)
    $matches = [regex]::Matches($content, '<img[^>]+logo[^>]*>')
    foreach ($m in $matches) {
        Write-Output "$($f.Name): $($m.Value)"
    }
}
