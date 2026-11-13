$files = Get-ChildItem "C:\Users\User\.gemini\antigravity\scratch\hoital-kristus-clinic\*.html"
foreach ($f in $files) {
    $c = [System.IO.File]::ReadAllText($f.FullName, [System.Text.Encoding]::UTF8)

    $headerCount = [regex]::Matches($c, '<header').Count
    $navCount = [regex]::Matches($c, '<nav').Count
    $primaryMenuCount = [regex]::Matches($c, 'class="primary-menu').Count
    $megaMenuCount = [regex]::Matches($c, 'class="mega-menu').Count
    $mainHeaderCount = [regex]::Matches($c, 'class="[^"]*main-header').Count
    $mobilePanelCount = [regex]::Matches($c, 'class="[^"]*mobile-navigation-panel').Count
    $mobileMenuCount = [regex]::Matches($c, 'class="[^"]*mobile-menu').Count

    Write-Output "FILE: $($f.Name)"
    Write-Output "   <header> tags: $headerCount | <nav> tags: $navCount"
    Write-Output "   primary-menu: $primaryMenuCount | mega-menu: $megaMenuCount | main-header: $mainHeaderCount"
    Write-Output "   mobile-panel: $mobilePanelCount | mobile-menu: $mobileMenuCount"
}
