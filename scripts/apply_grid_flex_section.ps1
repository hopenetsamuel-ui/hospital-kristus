$ErrorActionPreference = "Stop"

$rootDir = "C:\Users\User\.gemini\antigravity\scratch\hoital-kristus-clinic"

$cards = @(
    @{
        title = "Medical services"
        icon = "images/6a8bab2c9749bc55a071b684_service-icon1.svg"
        desc = "Comprehensive primary healthcare, regular medical evaluations, chronic disease management, and tailored wellness programs for families."
        tags = @("Primary Care", "Preventive Medicine", "Chronic Care", "Health Checkups")
        param = "medical-services"
    },
    @{
        title = "Antenatal"
        icon = "images/6a8d463bdc0b11b41e529923_service-icon3.svg"
        desc = "Dedicated maternal care, continuous fetal wellness monitoring, expert obstetric guidance, and comprehensive postnatal support."
        tags = @("Maternal Care", "Prenatal Screening", "Fetal Monitoring", "Postnatal Support")
        param = "antenatal"
    },
    @{
        title = "Surgical"
        icon = "images/6a8d468adf1a38892e2dbd23_service-icon4.svg"
        desc = "Advanced inpatient and day surgery conducted in sterile, modern operating suites by certified surgeons and anesthetists."
        tags = @("General Surgery", "Minimally Invasive", "Day Surgery", "Post-Op Care")
        param = "surgical"
    },
    @{
        title = "Specialist services"
        icon = "images/6a8d460e4dbd01d32140841c_service-icon2.svg"
        desc = "Direct access to accredited consultant clinics across cardiology, endocrinology, neurology, pediatrics, and internal medicine."
        tags = @("Consultant Clinics", "Multi-Disciplinary", "Second Opinions", "Complex Diagnoses")
        param = "specialist-services"
    },
    @{
        title = "Laboratory services"
        icon = "images/6a8d46c739effe68d72a4068_service-icon5.svg"
        desc = "Fully automated, high-precision pathology and clinical diagnostic laboratory delivering reliable, prompt same-day test results."
        tags = @("Clinical Pathology", "Hematology", "Biochemistry", "Microbiology")
        param = "laboratory-services"
    },
    @{
        title = "Ultrasound scan"
        icon = "images/6a8d46f638c108ec7470cf4b_service-icon6.svg"
        desc = "High-resolution 2D, 3D/4D obstetric sonography, abdominal, pelvic, vascular Doppler, and soft tissue imaging by experienced sonographers."
        tags = @("High-Resolution Imaging", "3D/4D Obstetric Scan", "Doppler Diagnostics", "Pelvic & Abdominal")
        param = "ultrasound-scan"
    },
    @{
        title = "Emergency"
        icon = "images/service-icon7.svg"
        desc = "24/7 round-the-clock emergency medical response and trauma care unit equipped for rapid resuscitation, acute stabilization, and ambulance response."
        tags = @("24/7 Availability", "Trauma & Resuscitation", "Rapid Triage", "Ambulance Response")
        param = "emergency"
        highlight = $true
    }
)

function Build-PracticeSectionHtml([bool]$isIndex) {
    $cardsHtml = ""
    foreach ($c in $cards) {
        $extraClass = if ($c.highlight) { " emergency-highlight" } else { "" }
        $badge = if ($c.highlight) { '<span class="badge-hk-emergency">24/7 Active</span>' } else { "" }
        $tagsStr = ""
        foreach ($t in $c.tags) {
            $tagsStr += "<div class=`"practice-tag-item`"><div class=`"practice-tag`">$t</div></div>"
        }

        $btnLink = if ($c.highlight) { "tel:+2348030007890" } else { "make-appointment.html?service=$($c.param)" }
        $btnText = if ($c.highlight) { "Call Emergency Now" } else { "Book Appointment" }

        $cardsHtml += @"
        <div role="listitem" class="practice-areas-item">
          <div class="practice-card$extraClass">
            <div class="practice-card-header">
              <a href="make-appointment.html?service=$($c.param)" class="practice-card-title">$($c.title)$badge</a>
              <div class="practice-icon-ribbon">
                <img loading="lazy" src="$($c.icon)" alt="$($c.title)" class="practice-icon"/>
              </div>
              <div class="code-embed w-embed">
                <svg xmlns="http://www.w3.org/2000/svg" width="13" height="13" viewBox="0 0 13 13" fill="none">
                  <path d="M0 0V13H13L0 0Z" fill="#21AE64"/>
                </svg>
              </div>
            </div>
            <div class="practice-card-body">
              <div class="practice-description">$($c.desc)</div>
              <div class="practice-tags-list">
                $tagsStr
              </div>
            </div>
            <div class="practice-card-footer">
              <a href="$btnLink" class="practice-button w-inline-block">
                <div class="btn-text-practice">$btnText</div>
                <div class="icon-btn w-embed">
                  <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 14 14" fill="none">
                    <path d="M10.089 7.46427L5.71403 11.8393C5.59074 11.9626 5.42354 12.0318 5.24919 12.0318C5.07483 12.0318 4.90763 11.9626 4.78434 11.8393C4.66106 11.716 4.5918 11.5488 4.5918 11.3744C4.5918 11.2001 4.66106 11.0329 4.78434 10.9096L8.69504 6.99998L4.78544 3.08927C4.72439 3.02823 4.67597 2.95576 4.64293 2.876C4.60989 2.79624 4.59289 2.71076 4.59289 2.62443C4.59289 2.5381 4.60989 2.45262 4.64293 2.37286C4.67597 2.2931 4.72439 2.22063 4.78544 2.15959C4.84648 2.09854 4.91895 2.05012 4.99871 2.01708C5.07847 1.98404 5.16395 1.96704 5.25028 1.96704C5.33661 1.96704 5.42209 1.98404 5.50185 2.01708C5.58161 2.05012 5.65408 2.09854 5.71512 2.15959L10.0901 6.53459C10.1512 6.59563 10.1997 6.66813 10.2327 6.74794C10.2657 6.82774 10.2827 6.91328 10.2826 6.99966C10.2825 7.08603 10.2653 7.17153 10.2321 7.25126C10.1989 7.33099 10.1503 7.40338 10.089 7.46427Z" fill="currentColor"/>
                  </svg>
                </div>
              </a>
            </div>
          </div>
        </div>
"@
    }

    $ctaButton = if ($isIndex) {
        @"
      <div class="practice-cta-wrapper text-center mt-5">
        <a href="our-services.html" class="primary-button w-inline-block">
          <div>View All Medical Services</div>
          <div class="icon-btn w-embed">
            <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 14 14" fill="none">
              <path d="M10.089 7.46427L5.71403 11.8393C5.59074 11.9626 5.42354 12.0318 5.24919 12.0318C5.07483 12.0318 4.90763 11.9626 4.78434 11.8393C4.66106 11.716 4.5918 11.5488 4.5918 11.3744C4.5918 11.2001 4.66106 11.0329 4.78434 10.9096L8.69504 6.99998L4.78544 3.08927C4.72439 3.02823 4.67597 2.95576 4.64293 2.876C4.60989 2.79624 4.59289 2.71076 4.59289 2.62443C4.59289 2.5381 4.60989 2.45262 4.64293 2.37286C4.67597 2.2931 4.72439 2.22063 4.78544 2.15959C4.84648 2.09854 4.91895 2.05012 4.99871 2.01708C5.07847 1.98404 5.16395 1.96704 5.25028 1.96704C5.33661 1.96704 5.42209 1.98404 5.50185 2.01708C5.58161 2.05012 5.65408 2.09854 5.71512 2.15959L10.0901 6.53459C10.1512 6.59563 10.1997 6.66813 10.2327 6.74794C10.2657 6.82774 10.2827 6.91328 10.2826 6.99966C10.2825 7.08603 10.2653 7.17153 10.2321 7.25126C10.1989 7.33099 10.1503 7.40338 10.089 7.46427Z" fill="currentColor"/>
            </svg>
          </div>
        </a>
      </div>
"@
    } else { "" }

    return @"
    <div class="practice-areas-section">
      <div class="section-heading-wrapper text-center">
        <div class="sub-title fade-in-up">
          <div data-wf--sub-heading--variant="base" class="sub-heading">
            <div class="sub-heading-inner">
              <div class="sub-heading-text">We Provide the Best Service for your Health</div>
            </div>
          </div>
        </div>
        <h2 class="section-heading _04 heading-scroll">Our Practice Areas and Expertise</h2>
        <div class="section-subtitle fade-in-up-1">
          Hoital Kristus Clinic combines advanced clinical technology with board-certified medical experts across 7 disciplines to deliver exceptional patient-first care.
        </div>
      </div>
      <div class="space-60px"></div>
      
      <!-- Responsive CSS Grid / Flexbox Layout Container -->
      <div class="practice-areas-grid-container">
        <div role="list" class="practice-areas-grid-list">
$cardsHtml
        </div>
      </div>
      
      <div class="space-40px"></div>
$ctaButton
    </div>
"@
}

# 1. Update index.html
$idxPath = Join-Path $rootDir "index.html"
$idx = [System.IO.File]::ReadAllText($idxPath, [System.Text.Encoding]::UTF8)

$idxStart = $idx.IndexOf('<div class="specialties-section">')
$idxEnd = $idx.IndexOf('<div class="facility-overview-section">')

if ($idxStart -ge 0 -and $idxEnd -ge 0) {
    $idxInner = Build-PracticeSectionHtml $true
    $newSpecialtiesSection = @"
<div class="specialties-section">
  <div class="container">
$idxInner
  </div>
</div>
<div class="space-100px"></div>
"@
    $idx = $idx.Substring(0, $idxStart) + $newSpecialtiesSection + $idx.Substring($idxEnd)
    [System.IO.File]::WriteAllText($idxPath, $idx, [System.Text.Encoding]::UTF8)
    Write-Output "Successfully updated index.html with CSS Grid / Flex practice section!"
} else {
    Write-Output "Could not locate section bounds in index.html ($idxStart, $idxEnd)"
}

# 2. Update our-services.html
$srvPath = Join-Path $rootDir "our-services.html"
$srv = [System.IO.File]::ReadAllText($srvPath, [System.Text.Encoding]::UTF8)

$srvStart = $srv.IndexOf('<div class="practice-areas-section">')
$srvEnd = $srv.IndexOf('<div class="space-150px">', $srvStart)

if ($srvStart -ge 0 -and $srvEnd -ge 0) {
    $srvInner = Build-PracticeSectionHtml $false
    $srv = $srv.Substring(0, $srvStart) + $srvInner + $srv.Substring($srvEnd)
    [System.IO.File]::WriteAllText($srvPath, $srv, [System.Text.Encoding]::UTF8)
    Write-Output "Successfully updated our-services.html with CSS Grid / Flex practice section!"
} else {
    Write-Output "Could not locate section bounds in our-services.html ($srvStart, $srvEnd)"
}
