$files = Get-ChildItem "C:\Users\User\.gemini\antigravity\scratch\hoital-kristus-clinic\*.html"
foreach ($f in $files) {
    if ($f.Name -eq "404.html") { continue }
    $c = [System.IO.File]::ReadAllText($f.FullName, [System.Text.Encoding]::UTF8)
    $spacerPos = $c.IndexOf('class="navbar-spacer"></div>')
    
    # Find the closing of that old header: look for </div></div></div> followed by the first section
    # Let's see the first 3000 chars after navbar-spacer
    $snippet = $c.Substring($spacerPos, [System.Math]::Min(3000, $c.Length - $spacerPos))
    
    # Let's find where the real page content starts
    $match = [regex]::Match($snippet, '(?s)<div class="button-text _02">.*?</div></div></div>\s*(<div[^>]+>)')
    if ($match.Success) {
        Write-Output "$($f.Name): Matched old header end. Next tag is: $($match.Groups[1].Value)"
    } else {
        # Check what follows
        $btnPos = $snippet.IndexOf('Book An Appointment')
        Write-Output "$($f.Name): button pos $btnPos"
        if ($btnPos -ge 0) {
            $afterBtn = $snippet.Substring($btnPos, [System.Math]::Min(500, $snippet.Length - $btnPos))
            Write-Output "   after button: $afterBtn"
        }
    }
}
