$ErrorActionPreference = "Stop"

$rootDir = "C:\Users\User\.gemini\antigravity\scratch\hoital-kristus-clinic"

$pages = @(
    @{ file = "index.html"; active = "home" },
    @{ file = "make-appointment.html"; active = "appointment" },
    @{ file = "about.html"; active = "about" },
    @{ file = "our-services.html"; active = "services" },
    @{ file = "our-projects.html"; active = "projects" },
    @{ file = "our-doctor.html"; active = "doctors" },
    @{ file = "blog.html"; active = "blog" },
    @{ file = "contact.html"; active = "contact" },
    @{ file = "contact-us.html"; active = "contact" },
    @{ file = "404.html"; active = "" }
)

function Get-SaveALifeNavbar($activeKey) {
    $hActive = if ($activeKey -eq "home") { " active" } else { "" }
    $aActive = if ($activeKey -eq "appointment") { " active" } else { "" }
    $abActive = if ($activeKey -eq "about") { " active" } else { "" }
    $sActive = if ($activeKey -eq "services") { " active" } else { "" }
    $pActive = if ($activeKey -eq "projects") { " active" } else { "" }
    $dActive = if ($activeKey -eq "doctors") { " active" } else { "" }
    $bActive = if ($activeKey -eq "blog") { " active" } else { "" }
    $cActive = if ($activeKey -eq "contact") { " active" } else { "" }

    return @"
<!-- SaveALife Hospital-Style Navbar for Hospital Kristus Clinic -->
<header class="navbar" id="siteNavbar">
  <div class="container navbar__inner">
    <a class="navbar__logo" href="index.html">
      <img src="images/hospital-kristus-logo.svg" alt="Hospital Kristus Clinic" width="220" height="48" class="navbar__logo-img">
    </a>

    <nav class="navbar__nav" id="navbarNav">
      <ul class="navbar__links">
        <li><a href="index.html" class="nav-link-item$hActive">Home</a></li>
        <li><a href="make-appointment.html" class="nav-link-item$aActive">Book Appointment</a></li>
        <li><a href="about.html" class="nav-link-item$abActive">About</a></li>
        <li><a href="our-services.html" class="nav-link-item$sActive">Our Services</a></li>
        <li><a href="our-projects.html" class="nav-link-item$pActive">Projects</a></li>
        <li><a href="our-doctor.html" class="nav-link-item$dActive">Our Doctors</a></li>
        <li><a href="blog.html" class="nav-link-item$bActive">Blog</a></li>
        <li><a href="contact.html" class="nav-link-item$cActive">Contact Us</a></li>
      </ul>

      <div class="navbar__actions">
        <!-- WhatsApp Talk to a Doctor (SaveALife style) -->
        <a href="https://wa.me/2348030007890?text=Hello%20Hospital%20Kristus%20Clinic%2C%20I%20would%20like%20to%20consult%20with%20a%20doctor." target="_blank" rel="noopener noreferrer" class="navbar__whatsapp">
          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="currentColor">
            <path d="M17.472 14.382c-.297-.149-1.758-.867-2.03-.967-.273-.099-.471-.148-.67.15-.197.297-.767.966-.94 1.164-.173.199-.347.223-.644.075-.297-.15-1.255-.463-2.39-1.475-.883-.788-1.48-1.761-1.653-2.059-.173-.297-.018-.458.13-.606.134-.133.298-.347.446-.52.149-.174.198-.298.298-.497.099-.198.05-.371-.025-.52-.075-.149-.669-1.612-.916-2.207-.242-.579-.487-.5-.669-.51-.173-.008-.371-.01-.57-.01-.198 0-.52.074-.792.372-.272.297-1.04 1.016-1.04 2.479 0 1.462 1.065 2.875 1.213 3.074.149.198 2.096 3.2 5.077 4.487.709.306 1.262.489 1.694.625.712.227 1.36.195 1.871.118.571-.085 1.758-.719 2.006-1.413.248-.694.248-1.289.173-1.413-.074-.124-.272-.198-.57-.347m-5.421 7.403h-.004a9.87 9.87 0 01-5.031-1.378l-.361-.214-3.741.982.998-3.648-.235-.374a9.86 9.86 0 01-1.51-5.26c.001-5.45 4.436-9.884 9.888-9.884 2.64 0 5.122 1.03 6.988 2.898a9.825 9.825 0 012.893 6.994c-.003 5.45-4.437 9.884-9.885 9.884m8.413-18.297A11.815 11.815 0 0012.05 0C5.495 0 .16 5.335.157 11.892c0 2.096.547 4.142 1.588 5.945L.057 24l6.305-1.654a11.882 11.882 0 005.683 1.448h.005c6.554 0 11.89-5.335 11.893-11.893a11.821 11.821 0 00-3.48-8.413z"/>
          </svg>
          Talk to a Doctor
        </a>

        <!-- 24/7 Emergency CTA (SaveALife style) -->
        <a href="tel:+2348030007890" class="navbar__cta">
          24/7 Emergency
          <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5">
            <path d="M5 12h14M12 5l7 7-7 7"/>
          </svg>
        </a>
      </div>
    </nav>

    <!-- Mobile Hamburger Toggle -->
    <button type="button" aria-label="Toggle menu" class="navbar__hamburger" id="navbarHamburger">
      <span></span>
      <span></span>
      <span></span>
    </button>
  </div>
</header>
<div class="navbar__overlay" id="navbarOverlay"></div>
<div class="navbar-spacer"></div>
"@
}

foreach ($p in $pages) {
    $fPath = Join-Path $rootDir $p.file
    if (!(Test-Path $fPath)) { continue }

    Write-Output "Updating $($p.file)..."
    $c = [System.IO.File]::ReadAllText($fPath, [System.Text.Encoding]::UTF8)

    # 1. Replace all variations of Hoistal / Hoital with Hospital
    $c = [regex]::Replace($c, '(?i)hoistal kristus', 'Hospital Kristus')
    $c = [regex]::Replace($c, '(?i)hoital kristus', 'Hospital Kristus')
    $c = [regex]::Replace($c, '(?i)hoitalkristus', 'hospitalkristus')
    $c = [regex]::Replace($c, 'HOITAL KRISTUS', 'HOSPITAL KRISTUS')
    $c = [regex]::Replace($c, 'HOISTAL KRISTUS', 'HOSPITAL KRISTUS')
    $c = [regex]::Replace($c, 'Hoital', 'Hospital')
    $c = [regex]::Replace($c, 'Hoistal', 'Hospital')

    # Update logo source references
    $c = $c.Replace('images/hoital-kristus-logo.svg', 'images/hospital-kristus-logo.svg')
    $c = $c.Replace('images/hoital-kristus-logo-white.svg', 'images/hospital-kristus-logo-white.svg')

    # 2. Remove floating Webflow badge
    $c = [regex]::Replace($c, '(?s)<a[^>]*class="[^"]*w-webflow-badge[^"]*"[^>]*>.*?</a>', '')
    $c = [regex]::Replace($c, '(?s)<a[^>]*href="https://webflow\.com\?utm_campaign=brandjs"[^>]*>.*?</a>', '')

    # 3. Replace the old header with SaveALife-style navbar
    # In 404.html, replace <div class="main-header-1">...</div>
    if ($p.file -eq "404.html") {
        $c = [regex]::Replace($c, '(?s)<div class="main-header-1">.*?</div>\s*</div>\s*</div>', (Get-SaveALifeNavbar $p.active))
    } else {
        # In other pages, old header is inside <div class="page-wrapper"><div ... class="main-header-...
        $oldHeaderPattern = '(?s)<div[^>]*class="[^"]*main-header[^"]*"[^>]*>.*?(?=<!-- SaveALife|<div class="page-title|<div class="space-|<div class="home-paralax|<div class="service-details|<div class="about-hero|<div class="project-hero|<div class="blog-hero|<div class="contact-hero|<div class="appointment-hero)'
        if ($c -match $oldHeaderPattern) {
            $c = [regex]::Replace($c, $oldHeaderPattern, (Get-SaveALifeNavbar $p.active) + "`n")
        } else {
            # Alternate match: between <div class="page-wrapper"> and the first section
            $wrapperPos = $c.IndexOf('<div class="page-wrapper">')
            if ($wrapperPos -ge 0) {
                # Find start of next content block
                $nextPos = -1
                foreach ($marker in @('<div class="page-title', '<div class="home-paralax', '<div class="space-', '<div class="section', '<div class="inner-hero')) {
                    $mPos = $c.IndexOf($marker, $wrapperPos + 26)
                    if ($mPos -ge 0 -and ($nextPos -lt 0 -or $mPos -lt $nextPos)) {
                        $nextPos = $mPos
                    }
                }
                if ($nextPos -gt $wrapperPos) {
                    $c = $c.Substring(0, $wrapperPos + 26) + "`n" + (Get-SaveALifeNavbar $p.active) + "`n" + $c.Substring($nextPos)
                }
            }
        }
    }

    # Remove old mobile-navigation-panel at the bottom of the page if present
    $c = [regex]::Replace($c, '(?s)<div[^>]*class="mobile-navigation-panel"[^>]*>.*?</div>\s*</div>\s*</div>', '')

    [System.IO.File]::WriteAllText($fPath, $c, [System.Text.Encoding]::UTF8)
    Write-Output "Successfully updated $($p.file)"
}

Write-Output "All HTML files updated with Hospital Kristus and SaveALife Navbar!"
