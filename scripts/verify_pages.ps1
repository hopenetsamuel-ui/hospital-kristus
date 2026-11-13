$rootDir = "C:\Users\User\.gemini\antigravity\scratch\hoital-kristus-clinic"
$htmlFiles = Get-ChildItem -Path $rootDir -Filter "*.html"

Write-Output "=== HTML FILES IN ROOT ==="
foreach ($f in $htmlFiles) {
    $content = [System.IO.File]::ReadAllText($f.FullName, [System.Text.Encoding]::UTF8)
    
    # Check for remaining fycare links
    $fycareHrefs = [regex]::Matches($content, 'href=["''][^"'']*fycare[^"'']*["'']')
    # Check for remaining webflow cdn images
    $cdnImgs = [regex]::Matches($content, 'src=["'']https://cdn\.prod\.website-files\.com[^"'']*["'']')
    # Check title
    $title = [regex]::Match($content, '<title>(.*?)</title>').Groups[1].Value
    # Check for Hoital Kristus
    $hkCount = [regex]::Matches($content, 'Hoital Kristus').Count
    # Check for address
    $addrCount = [regex]::Matches($content, 'Eliparanwo').Count

    Write-Output "FILE: $($f.Name) | Title: $title"
    Write-Output "   Hoital Kristus mentions: $hkCount | Eliparanwo mentions: $addrCount"
    Write-Output "   Remaining fycare hrefs: $($fycareHrefs.Count) | Remaining CDN images: $($cdnImgs.Count)"
}
