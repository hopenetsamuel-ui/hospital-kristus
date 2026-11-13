$ErrorActionPreference = "Stop"

$rootDir = "C:\Users\User\.gemini\antigravity\scratch\hoital-kristus-clinic"
$rawDir = Join-Path $rootDir "raw_pages"

$urlMapJson = Get-Content (Join-Path $rootDir "url_to_local_map.json") -Raw | ConvertFrom-Json
$jsMapJson = Get-Content (Join-Path $rootDir "js_to_local_map.json") -Raw | ConvertFrom-Json
$serviceCardsHtml = Get-Content (Join-Path $rootDir "service_cards.html") -Raw

$pages = @(
    @{ src = "index.html"; dest = "index.html"; title = "Hoital Kristus Clinic - Premium Healthcare & Medical Services" },
    @{ src = "our-services.html"; dest = "our-services.html"; title = "Our Services - Hoital Kristus Clinic" },
    @{ src = "our-projects.html"; dest = "our-projects.html"; title = "Our Medical Projects & Case Studies - Hoital Kristus Clinic" },
    @{ src = "make-appointment.html"; dest = "make-appointment.html"; title = "Make an Appointment - Hoital Kristus Clinic" },
    @{ src = "blog.html"; dest = "blog.html"; title = "Health News & Medical Blog - Hoital Kristus Clinic" },
    @{ src = "contact-us.html"; dest = "contact.html"; title = "Contact Us - Hoital Kristus Clinic | Port Harcourt" },
    @{ src = "contact-us.html"; dest = "contact-us.html"; title = "Contact Us - Hoital Kristus Clinic | Port Harcourt" },
    @{ src = "about.html"; dest = "about.html"; title = "About Hoital Kristus Clinic - Excellence in Medical Care" },
    @{ src = "our-doctor.html"; dest = "our-doctor.html"; title = "Our Doctors & Specialists - Hoital Kristus Clinic" }
)

foreach ($p in $pages) {
    Write-Output "Processing $($p.dest)..."
    $rawPath = Join-Path $rawDir $p.src
    $html = [System.IO.File]::ReadAllText($rawPath, [System.Text.Encoding]::UTF8)

    # 1. Update Title
    $html = [regex]::Replace($html, '(?i)<title>.*?</title>', "<title>$($p.title)</title>")

    # 2. Replace CSS stylesheet link
    $html = [regex]::Replace($html, 'https://cdn\.prod\.website-files\.com/6a6b05680d42218e36607649/css/fycare\.webflow\.shared\.[0-9a-fA-F]+\.css', "css/webflow-style.css")

    # 3. Add Google Fonts, Bootstrap & Custom CSS before </head>
    $customHead = @"
  <!-- Google Fonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=Schibsted+Grotesk:ital,wght@0,400;0,500;0,600;0,700;0,800;1,400;1,600&display=swap" rel="stylesheet">
  <!-- Bootstrap 5 & Icons -->
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <link rel="stylesheet" href="css/bootstrap-icons.min.css">
  <!-- Custom Clinic Styles -->
  <link rel="stylesheet" href="css/custom.css">
</head>
"@
    $html = [regex]::Replace($html, '</head>', $customHead)

    # 4. Map JS scripts to local
    foreach ($prop in $jsMapJson.psobject.properties) {
        $u = [regex]::Escape($prop.Name)
        $local = $prop.Value
        $html = [regex]::Replace($html, $u, $local)
    }

    # 5. Add Bootstrap JS and main.js before </body>
    $customBodyEnd = @"
  <!-- Bootstrap 5 Bundle JS -->
  <script src="js/bootstrap.bundle.min.js"></script>
  <!-- Main Clinic Interactive JS -->
  <script src="js/main.js"></script>
</body>
"@
    $html = [regex]::Replace($html, '</body>', $customBodyEnd)

    # 6. Map all Images to local
    foreach ($prop in $urlMapJson.psobject.properties) {
        $u = [regex]::Escape($prop.Name)
        $local = $prop.Value
        $html = [regex]::Replace($html, $u, $local)
    }

    # 7. Connect all navigation links
    $html = [regex]::Replace($html, 'href=["'']/(index(\.html)?)?["'']', 'href="index.html"')
    $html = [regex]::Replace($html, 'href=["'']https://fycare\.webflow\.io/?["'']', 'href="index.html"')
    $html = [regex]::Replace($html, 'href=["'']https://fycare\.webflow\.io/our-services["'']', 'href="our-services.html"')
    $html = [regex]::Replace($html, 'href=["'']https://fycare\.webflow\.io/our-projects["'']', 'href="our-projects.html"')
    $html = [regex]::Replace($html, 'href=["'']https://fycare\.webflow\.io/make-appointment["'']', 'href="make-appointment.html"')
    $html = [regex]::Replace($html, 'href=["'']https://fycare\.webflow\.io/blog["'']', 'href="blog.html"')
    $html = [regex]::Replace($html, 'href=["'']https://fycare\.webflow\.io/contact-us["'']', 'href="contact.html"')
    $html = [regex]::Replace($html, 'href=["'']https://fycare\.webflow\.io/about["'']', 'href="about.html"')
    $html = [regex]::Replace($html, 'href=["'']https://fycare\.webflow\.io/our-doctor["'']', 'href="our-doctor.html"')
    
    $html = [regex]::Replace($html, 'href=["'']/our-services["'']', 'href="our-services.html"')
    $html = [regex]::Replace($html, 'href=["'']/our-projects["'']', 'href="our-projects.html"')
    $html = [regex]::Replace($html, 'href=["'']/make-appointment["'']', 'href="make-appointment.html"')
    $html = [regex]::Replace($html, 'href=["'']/blog["'']', 'href="blog.html"')
    $html = [regex]::Replace($html, 'href=["'']/contact-us["'']', 'href="contact.html"')
    $html = [regex]::Replace($html, 'href=["'']/about["'']', 'href="about.html"')
    $html = [regex]::Replace($html, 'href=["'']/our-doctor["'']', 'href="our-doctor.html"')
    $html = [regex]::Replace($html, 'href=["'']/virtual-care["'']', 'href="make-appointment.html?service=virtual-care"')
    $html = [regex]::Replace($html, 'href=["'']/billing-and-insurance["'']', 'href="contact.html#billing"')
    $html = [regex]::Replace($html, 'href=["'']/faqs["'']', 'href="about.html#faqs"')

    $html = [regex]::Replace($html, 'href=["''](/)?services/[^"'']+["'']', 'href="our-services.html"')
    $html = [regex]::Replace($html, 'href=["'']https://fycare\.webflow\.io/services/[^"'']+["'']', 'href="our-services.html"')
    $html = [regex]::Replace($html, 'href=["''](/)?projects/[^"'']+["'']', 'href="our-projects.html"')
    $html = [regex]::Replace($html, 'href=["'']https://fycare\.webflow\.io/projects/[^"'']+["'']', 'href="our-projects.html"')
    $html = [regex]::Replace($html, 'href=["''](/)?post/[^"'']+["'']', 'href="blog.html"')
    $html = [regex]::Replace($html, 'href=["'']https://fycare\.webflow\.io/post/[^"'']+["'']', 'href="blog.html"')
    $html = [regex]::Replace($html, 'href=["''](/)?team/[^"'']+["'']', 'href="our-doctor.html"')
    $html = [regex]::Replace($html, 'href=["'']https://fycare\.webflow\.io/team/[^"'']+["'']', 'href="our-doctor.html"')

    # 8. Branding and Hospital Name
    $html = [regex]::Replace($html, '(?i)Fycare Medical Center', 'Hoital Kristus Clinic')
    $html = [regex]::Replace($html, '(?i)Fycare Clinic', 'Hoital Kristus Clinic')
    $html = [regex]::Replace($html, 'Fycare', 'Hoital Kristus Clinic')
    $html = [regex]::Replace($html, 'FyCare', 'Hoital Kristus Clinic')
    $html = [regex]::Replace($html, 'FYCARE', 'HOITAL KRISTUS CLINIC')

    # Replace logos
    $html = [regex]::Replace($html, 'images/6a6b16e7189ca5823365c14d_logo\.webp', 'images/hoital-kristus-logo.svg')
    $html = [regex]::Replace($html, 'images/6a6c2268d905f50a9a230fbf_logo-footer\.webp', 'images/hoital-kristus-logo-white.svg')

    # 9. Address and Contact Information
    $html = [regex]::Replace($html, '(?i)Suite 502, Lexington Ave, NY', '101 Eliparanwo, Port Harcourt')
    $html = [regex]::Replace($html, '(?i)Lexington Ave, NY', '101 Eliparanwo, Port Harcourt')
    $html = [regex]::Replace($html, '(?i)NY 10001, United States', '101 Eliparanwo, Port Harcourt, Rivers State')
    $html = [regex]::Replace($html, '(?i)New York, NY 10001', '101 Eliparanwo, Port Harcourt')
    $html = [regex]::Replace($html, '\+1800 - 668 333', '+234 803 000 7890')
    $html = [regex]::Replace($html, '\+1 \(800\) - 668 333', '+234 803 000 7890')
    $html = [regex]::Replace($html, 'support@fycare\.com', 'contact@hoitalkristusclinic.com')
    $html = [regex]::Replace($html, 'contact@fycare\.com', 'contact@hoitalkristusclinic.com')

    # 10. Replace Services List on Homepage and Services Page
    if ($p.dest -eq "index.html" -or $p.dest -eq "our-services.html") {
        $practicePattern = '(?s)<div role="list" class="practice-areas-list w-dyn-items">.*?</div>\s*</div>\s*</div>'
        $practiceReplacement = @"
<div role="list" class="practice-areas-list w-dyn-items">
$serviceCardsHtml
</div>
</div>
</div>
"@
        if ($html -match $practicePattern) {
            $html = [regex]::Replace($html, $practicePattern, $practiceReplacement)
            Write-Output "Successfully replaced services list with 7 clinic services in $($p.dest)"
        }
    }

    # 11. Replace Service Dropdowns in Forms
    $formSelectPattern = '(?s)<select[^>]*id="(General-Checkup|Practice-Areas)"[^>]*>.*?</select>'
    $formSelectReplacement = @"
<select id="`$1" name="`$1" data-name="Practice Areas" required="" class="form-text-field w-select">
  <option value="">Select Service Area</option>
  <option value="Medical services">Medical services</option>
  <option value="Antenatal">Antenatal</option>
  <option value="Surgical">Surgical</option>
  <option value="Specialist services">Specialist services</option>
  <option value="Laboratory services">Laboratory services</option>
  <option value="Ultrasound scan">Ultrasound scan</option>
  <option value="Emergency">Emergency (24/7)</option>
</select>
"@
    $html = [regex]::Replace($html, $formSelectPattern, $formSelectReplacement)

    # 12. Write output file
    $destPath = Join-Path $rootDir $p.dest
    [System.IO.File]::WriteAllText($destPath, $html, [System.Text.Encoding]::UTF8)
    Write-Output "Generated $destPath ($($html.Length) bytes)"
}

Write-Output "=== SITE BUILD COMPLETED SUCCESSFULLY ==="
