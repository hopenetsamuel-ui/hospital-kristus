$idx = [System.IO.File]::ReadAllText('C:\Users\User\.gemini\antigravity\scratch\hoital-kristus-clinic\index.html', [System.Text.Encoding]::UTF8)
Write-Output "=== CHECK INDEX.HTML ==="
Write-Output "Has practice-areas-grid-list: $($idx.Contains('practice-areas-grid-list'))"
Write-Output "Has specialties-slider: $($idx.Contains('specialties-slider'))"
Write-Output "Medical services found: $($idx.Contains('Medical services'))"
Write-Output "Antenatal found: $($idx.Contains('Antenatal'))"
Write-Output "Surgical found: $($idx.Contains('Surgical'))"
Write-Output "Specialist services found: $($idx.Contains('Specialist services'))"
Write-Output "Laboratory services found: $($idx.Contains('Laboratory services'))"
Write-Output "Ultrasound scan found: $($idx.Contains('Ultrasound scan'))"
Write-Output "Emergency found: $($idx.Contains('Emergency'))"

$srv = [System.IO.File]::ReadAllText('C:\Users\User\.gemini\antigravity\scratch\hoital-kristus-clinic\our-services.html', [System.Text.Encoding]::UTF8)
Write-Output "=== CHECK OUR-SERVICES.HTML ==="
Write-Output "Has practice-areas-grid-list: $($srv.Contains('practice-areas-grid-list'))"
Write-Output "Medical services found: $($srv.Contains('Medical services'))"
Write-Output "Emergency found: $($srv.Contains('Emergency'))"
