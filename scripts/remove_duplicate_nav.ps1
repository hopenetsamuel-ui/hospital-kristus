$files = Get-ChildItem "C:\Users\User\.gemini\antigravity\scratch\hoital-kristus-clinic\*.html"
foreach ($f in $files) {
    if ($f.Name -eq "404.html") { continue }
    $c = [System.IO.File]::ReadAllText($f.FullName, [System.Text.Encoding]::UTF8)

    $spacerPos = $c.IndexOf('class="navbar-spacer"></div>')
    if ($spacerPos -ge 0) {
        $btnPos = $c.IndexOf('Book An Appointment', $spacerPos)
        if ($btnPos -ge 0) {
            $closingPos = $c.IndexOf('</div></div></div>', $btnPos)
            if ($closingPos -ge 0) {
                $cutStart = $spacerPos + 29
                $cutEnd = $closingPos + 18
                $removedBlock = $c.Substring($cutStart, $cutEnd - $cutStart)
                $newContent = $c.Substring(0, $cutStart) + "`n" + $c.Substring($cutEnd)
                [System.IO.File]::WriteAllText($f.FullName, $newContent, [System.Text.Encoding]::UTF8)
                Write-Output "$($f.Name): Removed $($cutEnd - $cutStart) bytes of duplicate nav block!"
            } else {
                Write-Output "$($f.Name): Could not find closing after button"
            }
        } else {
            Write-Output "$($f.Name): Button not found after spacer"
        }
    }
}
