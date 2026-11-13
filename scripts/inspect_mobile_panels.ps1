$files = Get-ChildItem "C:\Users\User\.gemini\antigravity\scratch\hoital-kristus-clinic\*.html"
foreach ($f in $files) {
    $c = [System.IO.File]::ReadAllText($f.FullName, [System.Text.Encoding]::UTF8)
    $hasMobile = $c.IndexOf("mobile-menu-main") -ge 0
    $hasMobilePanel = $c.IndexOf("mobile-navigation-panel") -ge 0
    Write-Output "$($f.Name): mobile-menu-main: $hasMobile, mobile-navigation-panel: $hasMobilePanel"
}
