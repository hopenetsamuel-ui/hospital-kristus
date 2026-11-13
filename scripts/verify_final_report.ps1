$rootDir = "C:\Users\User\.gemini\antigravity\scratch\hoital-kristus-clinic"
$htmlFiles = Get-ChildItem -Path $rootDir -Filter "*.html"

Write-Output "=== COMPREHENSIVE VERIFICATION REPORT ==="

$totalHoital = 0
$totalHoistal = 0
$totalHospital = 0

foreach ($f in $htmlFiles) {
    $content = [System.IO.File]::ReadAllText($f.FullName, [System.Text.Encoding]::UTF8)

    $hasSaveALifeNav = $content.Contains('id="siteNavbar"')
    $hasWhatsappBtn = $content.Contains('class="navbar__whatsapp"')
    $hasCtaBtn = $content.Contains('class="navbar__cta"')
    $hasOverlay = $content.Contains('id="navbarOverlay"')
    $hasWebflowBadge = $content -match '(?i)(w-webflow-badge|made in webflow)'
    
    $hoitalCount = [regex]::Matches($content, '(?i)hoital').Count
    $hoistalCount = [regex]::Matches($content, '(?i)hoistal').Count
    $hospitalCount = [regex]::Matches($content, 'Hospital Kristus').Count

    $totalHoital += $hoitalCount
    $totalHoistal += $hoistalCount
    $totalHospital += $hospitalCount

    Write-Output "FILE: $($f.Name)"
    Write-Output "   SaveALife Navbar: $hasSaveALifeNav | WhatsApp Button: $hasWhatsappBtn | CTA: $hasCtaBtn | Overlay: $hasOverlay"
    Write-Output "   Hospital Kristus: $hospitalCount | Remaining Hoital/Hoistal: $($hoitalCount + $hoistalCount)"
    Write-Output "   Webflow Badge in DOM: $hasWebflowBadge"
}

Write-Output "-----------------------------------------"
Write-Output "TOTAL Hospital Kristus mentions: $totalHospital"
Write-Output "TOTAL Hoital mentions remaining: $totalHoital"
Write-Output "TOTAL Hoistal mentions remaining: $totalHoistal"

# Test HTTP Server
try {
    $idxResp = Invoke-WebRequest -Uri 'http://localhost:3000/index.html' -UseBasicParsing
    Write-Output "HTTP Server Status: $($idxResp.StatusCode)"
} catch {
    Write-Output "HTTP Server check failed: $_"
}
