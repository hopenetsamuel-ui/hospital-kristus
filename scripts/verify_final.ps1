$idx = [System.IO.File]::ReadAllText('C:\Users\User\.gemini\antigravity\scratch\hoital-kristus-clinic\index.html', [System.Text.Encoding]::UTF8)
Write-Output "--- VERIFY INDEX.HTML ---"
Write-Output "Title: $([regex]::Match($idx, '<title>(.*?)</title>').Groups[1].Value)"
Write-Output "101 Eliparanwo, Port Harcourt: $($idx.Contains('101 Eliparanwo, Port Harcourt'))"
Write-Output "Hoital Kristus: $($idx.Contains('Hoital Kristus'))"
Write-Output "Medical services: $($idx.Contains('Medical services'))"
Write-Output "Antenatal: $($idx.Contains('Antenatal'))"
Write-Output "Surgical: $($idx.Contains('Surgical'))"
Write-Output "Specialist services: $($idx.Contains('Specialist services'))"
Write-Output "Laboratory services: $($idx.Contains('Laboratory services'))"
Write-Output "Ultrasound scan: $($idx.Contains('Ultrasound scan'))"
Write-Output "Emergency: $($idx.Contains('Emergency'))"
Write-Output "Bootstrap CSS: $($idx.Contains('css/bootstrap.min.css'))"
Write-Output "Webflow CSS: $($idx.Contains('css/webflow-style.css'))"
Write-Output "Custom CSS: $($idx.Contains('css/custom.css'))"
Write-Output "Bootstrap JS: $($idx.Contains('js/bootstrap.bundle.min.js'))"
Write-Output "Main JS: $($idx.Contains('js/main.js'))"

$srv = [System.IO.File]::ReadAllText('C:\Users\User\.gemini\antigravity\scratch\hoital-kristus-clinic\our-services.html', [System.Text.Encoding]::UTF8)
Write-Output "--- VERIFY OUR-SERVICES.HTML ---"
Write-Output "Title: $([regex]::Match($srv, '<title>(.*?)</title>').Groups[1].Value)"
Write-Output "Medical services: $($srv.Contains('Medical services'))"
Write-Output "Antenatal: $($srv.Contains('Antenatal'))"
Write-Output "Surgical: $($srv.Contains('Surgical'))"
Write-Output "Specialist services: $($srv.Contains('Specialist services'))"
Write-Output "Laboratory services: $($srv.Contains('Laboratory services'))"
Write-Output "Ultrasound scan: $($srv.Contains('Ultrasound scan'))"
Write-Output "Emergency: $($srv.Contains('Emergency'))"

$apt = [System.IO.File]::ReadAllText('C:\Users\User\.gemini\antigravity\scratch\hoital-kristus-clinic\make-appointment.html', [System.Text.Encoding]::UTF8)
Write-Output "--- VERIFY MAKE-APPOINTMENT.HTML ---"
Write-Output "Services in Select dropdown: $($apt.Contains('Medical services') -and $apt.Contains('Antenatal') -and $apt.Contains('Surgical') -and $apt.Contains('Ultrasound scan'))"

$cnt = [System.IO.File]::ReadAllText('C:\Users\User\.gemini\antigravity\scratch\hoital-kristus-clinic\contact.html', [System.Text.Encoding]::UTF8)
Write-Output "--- VERIFY CONTACT.HTML ---"
Write-Output "Address present: $($cnt.Contains('101 Eliparanwo, Port Harcourt'))"
