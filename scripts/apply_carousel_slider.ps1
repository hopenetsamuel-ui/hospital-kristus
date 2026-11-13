$ErrorActionPreference = "Stop"

$rootDir = "C:\Users\User\.gemini\antigravity\scratch\hoital-kristus-clinic"

# Definition of the 9 cards (3 slides x 3 cards per slide)
$slide1Cards = @(
    @{
        title = "Medical services"
        icon = "images/6a8bab2c9749bc55a071b684_service-icon1.svg"
        desc = "Comprehensive primary healthcare, routine clinical evaluations, chronic condition management, and customized wellness plans for all patients."
        tags = @("Primary Care", "Routine Checkups", "Chronic Care", "Preventive Health")
        param = "medical-services"
    },
    @{
        title = "Antenatal"
        icon = "images/6a8d463bdc0b11b41e529923_service-icon3.svg"
        desc = "Holistic prenatal and maternal healthcare providing continuous pregnancy monitoring, fetal development assessments, and postnatal support."
        tags = @("Maternal Care", "Prenatal Screening", "Fetal Monitoring", "Postnatal Support")
        param = "antenatal"
    },
    @{
        title = "Surgical"
        icon = "images/6a8d468adf1a38892e2dbd23_service-icon4.svg"
        desc = "State-of-the-art operative care delivering general, minimally invasive, and specialized elective and urgent surgical procedures."
        tags = @("General Surgery", "Minimally Invasive", "Day Surgery", "Post-Op Care")
        param = "surgical"
    }
)

$slide2Cards = @(
    @{
        title = "Specialist services"
        icon = "images/6a8d460e4dbd01d32140841c_service-icon2.svg"
        desc = "Multi-disciplinary specialist clinics covering internal medicine, cardiology, neurology, pediatrics, endocrinology, and orthopedics."
        tags = @("Consultant Clinics", "Multi-Disciplinary", "Specialist Diagnostics", "Second Opinions")
        param = "specialist-services"
    },
    @{
        title = "Laboratory services"
        icon = "images/6a8d46c739effe68d72a4068_service-icon5.svg"
        desc = "Automated, certified clinical diagnostic pathology lab offering rapid blood chemistry, hematology, microbiology, and molecular screenings."
        tags = @("Clinical Pathology", "Automated Diagnostics", "Rapid Blood Tests", "Microbiology")
        param = "laboratory-services"
    },
    @{
        title = "Ultrasound scan"
        icon = "images/6a8d46f638c108ec7470cf4b_service-icon6.svg"
        desc = "High-resolution diagnostic ultrasound sonography including 3D/4D obstetric imaging, abdominal, pelvic, vascular Doppler, and soft tissue scans."
        tags = @("3D/4D Obstetric Scan", "Abdominal & Pelvic", "Doppler Ultrasound", "High-Resolution")
        param = "ultrasound-scan"
    }
)

$slide3Cards = @(
    @{
        title = "Emergency"
        icon = "images/service-icon7.svg"
        desc = "Immediate 24-hour acute medical and trauma emergency response backed by an on-call resuscitation team, rapid triage, and ambulance service."
        tags = @("24/7 Availability", "Trauma & Resuscitation", "Acute Critical Care", "Ambulance Response")
        param = "emergency"
        highlight = $true
    },
    @{
        title = "Ambulance & Trauma"
        icon = "images/6a8d460e4dbd01d32140841c_service-icon2.svg"
        desc = "Dedicated patient transport and rapid paramedic dispatch operating 24 hours across Port Harcourt for urgent hospital admissions and transfers."
        tags = @("24/7 Dispatch", "Paramedic Care", "Rapid Response", "Port Harcourt")
        param = "emergency"
        highlight = $true
    },
    @{
        title = "Consultation & Checkups"
        icon = "images/6a8bab2c9749bc55a071b684_service-icon1.svg"
        desc = "Comprehensive preventative wellness packages, corporate health screenings, pre-employment checks, and specialized chronic care follow-ups."
        tags = @("Preventive Packages", "Corporate Health", "Executive Screening", "Holistic Wellness")
        param = "medical-services"
    }
)

function Render-Card($c) {
    $extraClass = if ($c.highlight) { " emergency-highlight" } else { "" }
    $badge = if ($c.highlight) { '<span class="badge-hk-emergency">24/7 Active</span>' } else { "" }
    $tagsStr = ""
    foreach ($t in $c.tags) {
        $tagsStr += "<div class=`"practice-tag-item`"><div class=`"practice-tag`">$t</div></div>"
    }

    $btnLink = if ($c.highlight) { "tel:+2348030007890" } else { "make-appointment.html?service=$($c.param)" }
    $btnText = if ($c.highlight) { "Call Emergency Now" } else { "Book Appointment" }

    return @"
          <div class="practice-areas-item">
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

function Build-CarouselSlide($cardList) {
    $cardsMarkup = ""
    foreach ($card in $cardList) {
        $cardsMarkup += Render-Card $card
    }
    return @"
      <div class="hk-carousel-slide">
        <div class="hk-slide-cards-grid">
$cardsMarkup
        </div>
      </div>
"@
}

function Build-CarouselSectionHtml([bool]$isIndex) {
    $slide1 = Build-CarouselSlide $slide1Cards
    $slide2 = Build-CarouselSlide $slide2Cards
    $slide3 = Build-CarouselSlide $slide3Cards

    $ctaBtn = if ($isIndex) {
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
      
      <!-- 3-Card Carousel Slider with Three Dots Navigation -->
      <div class="hk-carousel-wrapper">
        <div class="hk-carousel-container" id="practiceCarouselContainer">
          <div class="hk-carousel-track" id="practiceCarouselTrack">
$slide1
$slide2
$slide3
          </div>
        </div>
        
        <!-- Controls: Arrows and Three Dots Below -->
        <div class="hk-carousel-controls">
          <button type="button" class="hk-carousel-arrow prev" id="carouselPrevBtn" aria-label="Previous 3 Services">
            <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18" fill="none">
              <path d="M4.90926 9.37077L10.4017 14.8632C10.5565 15.018 10.7664 15.1049 10.9853 15.1049C11.2041 15.1049 11.4141 15.018 11.5688 14.8632C11.7236 14.7084 11.8105 14.4985 11.8105 14.2796C11.8105 14.0607 11.7236 13.8508 11.5688 13.6961L6.65928 8.78789L11.5675 3.87835C11.6441 3.80171 11.7049 3.71073 11.7464 3.6106C11.7878 3.51047 11.8092 3.40315 11.8092 3.29478C11.8092 3.1864 11.7878 3.07908 11.7464 2.97895C11.7049 2.87882 11.6441 2.78784 11.5675 2.71121C11.4908 2.63457 11.3998 2.57378 11.2997 2.5323C11.1996 2.49083 11.0923 2.46948 10.9839 2.46948C10.8755 2.46948 10.7682 2.49083 10.6681 2.5323C10.5679 2.57378 10.4769 2.63457 10.4003 2.71121L4.90789 8.20363C4.83117 8.28026 4.77034 8.37128 4.72887 8.47147C4.68741 8.57166 4.66613 8.67905 4.66626 8.78748C4.66639 8.89592 4.68792 9.00326 4.72962 9.10335C4.77132 9.20344 4.83236 9.29432 4.90926 9.37077Z" fill="currentColor"/>
            </svg>
          </button>
          
          <!-- Three Dots for Carousel Navigation -->
          <div class="hk-carousel-dots" id="practiceCarouselDots" role="tablist">
            <button type="button" class="hk-dot active" data-slide="0" aria-label="Slide 1: Medical, Antenatal, Surgical"></button>
            <button type="button" class="hk-dot" data-slide="1" aria-label="Slide 2: Specialist, Laboratory, Ultrasound"></button>
            <button type="button" class="hk-dot" data-slide="2" aria-label="Slide 3: Emergency, Ambulance, Checkups"></button>
          </div>
          
          <button type="button" class="hk-carousel-arrow next" id="carouselNextBtn" aria-label="Next 3 Services">
            <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18" fill="none">
              <path d="M12.6669 9.37077L7.17449 14.8632C7.01971 15.018 6.8098 15.1049 6.59092 15.1049C6.37204 15.1049 6.16212 15.018 6.00735 14.8632C5.85258 14.7084 5.76563 14.4985 5.76562 14.2796C5.76562 14.0607 5.85258 13.8508 6.00735 13.6961L10.9169 8.78789L6.00872 3.87835C5.93209 3.80171 5.87129 3.71073 5.82982 3.6106C5.78834 3.51047 5.767 3.40315 5.767 3.29478C5.767 3.1864 5.78834 3.07908 5.82982 2.97895C5.78834 2.87882 5.82982 2.97895C5.78834 3.07908 5.82982 3.1864 5.82982 3.29478C5.82982 3.40315 5.78834 3.51047 5.82982 3.6106C5.87129 3.71073 5.93209 3.80171 6.00872 3.87835C6.08536 2.63457 6.17634 2.57378 6.27647 2.5323C6.37659 2.49083 6.48391 2.46948 6.59229 2.46948C6.70067 2.46948 6.80799 2.49083 6.90812 2.5323C7.00825 2.57378 7.09923 2.63457 7.17586 2.71121L12.6683 8.20363C12.745 8.28026 12.8058 8.37128 12.8473 8.47147C12.8888 8.57166 12.91 8.67905 12.9099 8.78748C12.9098 8.89592 12.8883 9.00326 12.8466 9.10335C12.8049 9.20344 12.7438 9.29432 12.6669 9.37077Z" fill="currentColor"/>
            </svg>
          </button>
        </div>
      </div>
      
      <div class="space-40px"></div>
$ctaBtn
    </div>
"@
}

# 1. Update index.html
$idxPath = Join-Path $rootDir "index.html"
$idx = [System.IO.File]::ReadAllText($idxPath, [System.Text.Encoding]::UTF8)

$idxStart = $idx.IndexOf('<div class="specialties-section">')
$idxEnd = $idx.IndexOf('<div class="facility-overview-section">')

if ($idxStart -ge 0 -and $idxEnd -ge 0) {
    $idxInner = Build-CarouselSectionHtml $true
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
    Write-Output "Successfully updated index.html with 3-card carousel slider & 3 dots!"
} else {
    Write-Output "Could not locate section bounds in index.html ($idxStart, $idxEnd)"
}

# 2. Update our-services.html
$srvPath = Join-Path $rootDir "our-services.html"
$srv = [System.IO.File]::ReadAllText($srvPath, [System.Text.Encoding]::UTF8)

$srvStart = $srv.IndexOf('<div class="practice-areas-section">')
$srvEnd = $srv.IndexOf('<div class="space-150px">', $srvStart)

if ($srvStart -ge 0 -and $srvEnd -ge 0) {
    $srvInner = Build-CarouselSectionHtml $false
    $srv = $srv.Substring(0, $srvStart) + $srvInner + $srv.Substring($srvEnd)
    [System.IO.File]::WriteAllText($srvPath, $srv, [System.Text.Encoding]::UTF8)
    Write-Output "Successfully updated our-services.html with 3-card carousel slider & 3 dots!"
} else {
    Write-Output "Could not locate section bounds in our-services.html ($srvStart, $srvEnd)"
}
