$idx = [System.IO.File]::ReadAllText('C:\Users\User\.gemini\antigravity\scratch\hoital-kristus-clinic\index.html', [System.Text.Encoding]::UTF8)
Write-Output "=== VERIFY INDEX.HTML ==="
Write-Output "Has hk-carousel-track: $($idx.Contains('hk-carousel-track'))"
Write-Output "Has practiceCarouselDots: $($idx.Contains('practiceCarouselDots'))"
Write-Output "Dot count: $([regex]::Matches($idx, 'class="hk-dot[^"]*"').Count)"
Write-Output "Slide count: $([regex]::Matches($idx, 'class="hk-carousel-slide"').Count)"
Write-Output "Practice card count: $([regex]::Matches($idx, 'class="practice-card[^"]*"').Count)"

$srv = [System.IO.File]::ReadAllText('C:\Users\User\.gemini\antigravity\scratch\hoital-kristus-clinic\our-services.html', [System.Text.Encoding]::UTF8)
Write-Output "=== VERIFY OUR-SERVICES.HTML ==="
Write-Output "Has hk-carousel-track: $($srv.Contains('hk-carousel-track'))"
Write-Output "Has practiceCarouselDots: $($srv.Contains('practiceCarouselDots'))"
Write-Output "Dot count: $([regex]::Matches($srv, 'class="hk-dot[^"]*"').Count)"
Write-Output "Slide count: $([regex]::Matches($srv, 'class="hk-carousel-slide"').Count)"
Write-Output "Practice card count: $([regex]::Matches($srv, 'class="practice-card[^"]*"').Count)"
