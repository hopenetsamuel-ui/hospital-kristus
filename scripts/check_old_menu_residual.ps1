$files = Get-ChildItem "C:\Users\User\.gemini\antigravity\scratch\hoital-kristus-clinic\*.html"
foreach ($f in $files) {
    $c = [System.IO.File]::ReadAllText($f.FullName, [System.Text.Encoding]::UTF8)
    $spacerPos = $c.IndexOf('class="navbar-spacer"></div>')
    if ($spacerPos -ge 0) {
        $snippet = $c.Substring($spacerPos + 29, [System.Math]::Min(1200, $c.Length - ($spacerPos + 29)))
        $hasOldMenu = $snippet -match 'primary-menu|sub-menu|menu-item|button-text'
        Write-Output "$($f.Name): has old residual menu after navbar-spacer = $hasOldMenu"
        if ($hasOldMenu) {
            Write-Output "   Preview: $($snippet.Substring(0, [System.Math]::Min(200, $snippet.Length)))"
        }
    }
}
