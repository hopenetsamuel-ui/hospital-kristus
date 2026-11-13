$servicesData = @(
    @{
        title = "Medical services"
        icon = "images/6a8bab2c9749bc55a071b684_service-icon1.svg"
        desc = "Comprehensive general clinical care, regular health checkups, preventative screening, and chronic disease management for individuals and families."
        tags = @("Primary Care", "Routine Checkups", "Chronic Care", "Preventive Health")
        param = "medical-services"
    },
    @{
        title = "Antenatal"
        icon = "images/6a8d463bdc0b11b41e529923_service-icon3.svg"
        desc = "Dedicated maternal care, personalized pregnancy monitoring, fetal development assessments, nutritional counseling, and post-delivery care."
        tags = @("Maternal Wellness", "Fetal Monitoring", "Prenatal Screenings", "Postnatal Support")
        param = "antenatal"
    },
    @{
        title = "Surgical"
        icon = "images/6a8d468adf1a38892e2dbd23_service-icon4.svg"
        desc = "Advanced inpatient and day-care surgical interventions performed in a sterile, modern operating theater by accredited surgeons and anesthetists."
        tags = @("General Surgery", "Minimally Invasive", "Day Surgery", "Post-Op Recovery")
        param = "surgical"
    },
    @{
        title = "Specialist services"
        icon = "images/6a8d460e4dbd01d32140841c_service-icon2.svg"
        desc = "Consultant clinics offering expert diagnoses across internal medicine, cardiology, neurology, pediatrics, endocrinology, and orthopedics."
        tags = @("Expert Consultants", "Multi-Disciplinary", "Specialist Diagnostics", "Second Opinions")
        param = "specialist-services"
    },
    @{
        title = "Laboratory services"
        icon = "images/6a8d46c739effe68d72a4068_service-icon5.svg"
        desc = "Automated high-precision pathology and clinical diagnostic laboratory delivering reliable, prompt results for blood chemistry, microbiology, and histology."
        tags = @("Clinical Pathology", "Automated Diagnostics", "Rapid Blood Tests", "Microbiology")
        param = "laboratory-services"
    },
    @{
        title = "Ultrasound scan"
        icon = "images/6a8d46f638c108ec7470cf4b_service-icon6.svg"
        desc = "High-definition 2D, 3D/4D obstetric sonography, abdominal, pelvic, vascular Doppler, and soft tissue ultrasound imaging by certified radiographers."
        tags = @("3D/4D Obstetric Scan", "Abdominal & Pelvic", "Doppler Ultrasound", "High-Resolution")
        param = "ultrasound-scan"
    },
    @{
        title = "Emergency"
        icon = "images/service-icon7.svg"
        desc = "24-hour round-the-clock emergency medical response and critical trauma unit equipped for rapid resuscitation, acute stabilization, and ambulance dispatch."
        tags = @("24/7 Availability", "Trauma & Resuscitation", "Acute Critical Care", "Ambulance Response")
        param = "emergency"
        highlight = $true
    }
)

function Generate-ServiceCardsHtml {
    $cardsHtml = ""
    foreach ($s in $servicesData) {
        $extraClass = if ($s.highlight) { " emergency-highlight" } else { "" }
        $emergencyBadge = if ($s.highlight) { '<span class="badge-hk-emergency">24/7 Active</span>' } else { "" }
        $tagItems = ""
        foreach ($t in $s.tags) {
            $tagItems += "<div class=`"practice-tag-item`"><div class=`"practice-tag`">$t</div></div>"
        }

        $cardsHtml += @"
<div role="listitem" class="practice-areas-item w-dyn-item">
  <div class="practice-card$extraClass">
    <div class="practice-card-header">
      <a href="make-appointment.html?service=$($s.param)" class="practice-card-title">$($s.title)$emergencyBadge</a>
      <div class="practice-icon-ribbon">
        <img loading="lazy" src="$($s.icon)" alt="$($s.title)" class="practice-icon"/>
      </div>
      <div class="code-embed w-embed">
        <svg xmlns="http://www.w3.org/2000/svg" width="13" height="13" viewBox="0 0 13 13" fill="none">
          <path d="M0 0V13H13L0 0Z" fill="#21AE64"/>
        </svg>
      </div>
    </div>
    <div class="practice-card-body">
      <div class="practice-description">$($s.desc)</div>
      <div class="practice-tags-list">
        $tagItems
      </div>
    </div>
    <a href="make-appointment.html?service=$($s.param)" class="practice-button w-inline-block">
      <div class="btn-text-practice">Book Appointment</div>
      <div class="icon-btn w-embed">
        <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 14 14" fill="none">
          <path d="M10.089 7.46427L5.71403 11.8393C5.59074 11.9626 5.42354 12.0318 5.24919 12.0318C5.07483 12.0318 4.90763 11.9626 4.78434 11.8393C4.66106 11.716 4.5918 11.5488 4.5918 11.3744C4.5918 11.2001 4.66106 11.0329 4.78434 10.9096L8.69504 6.99998L4.78544 3.08927C4.72439 3.02823 4.67597 2.95576 4.64293 2.876C4.60989 2.79624 4.59289 2.71076 4.59289 2.62443C4.59289 2.5381 4.60989 2.45262 4.64293 2.37286C4.67597 2.2931 4.72439 2.22063 4.78544 2.15959C4.84648 2.09854 4.91895 2.05012 4.99871 2.01708C5.07847 1.98404 5.16395 1.96704 5.25028 1.96704C5.33661 1.96704 5.42209 1.98404 5.50185 2.01708C5.58161 2.05012 5.65408 2.09854 5.71512 2.15959L10.0901 6.53459C10.1512 6.59563 10.1997 6.66813 10.2327 6.74794C10.2657 6.82774 10.2827 6.91328 10.2826 6.99966C10.2825 7.08603 10.2653 7.17153 10.2321 7.25126C10.1989 7.33099 10.1503 7.40338 10.089 7.46427Z" fill="currentColor"/>
        </svg>
      </div>
    </a>
  </div>
</div>
"@
    }
    return $cardsHtml
}

[System.IO.File]::WriteAllText("C:\Users\User\.gemini\antigravity\scratch\hoital-kristus-clinic\service_cards.html", (Generate-ServiceCardsHtml), [System.Text.Encoding]::UTF8)
Write-Output "Service cards HTML generated successfully."
