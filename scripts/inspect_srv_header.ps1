$srv = [System.IO.File]::ReadAllText('C:\Users\User\.gemini\antigravity\scratch\hoital-kristus-clinic\our-services.html', [System.Text.Encoding]::UTF8)

$m = [regex]::Match($srv, '(?s)<div[^>]*class="[^"]*main-header[^"]*"[^>]*>.*?</div>\s*</div>\s*</div>')
Write-Output "Found header in our-services: $($m.Success), length: $($m.Length)"
