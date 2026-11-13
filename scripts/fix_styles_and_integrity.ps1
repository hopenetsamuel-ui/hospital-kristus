$rootDir = "C:\Users\User\.gemini\antigravity\scratch\hoital-kristus-clinic"
$htmlFiles = Get-ChildItem -Path $rootDir -Filter "*.html"

foreach ($f in $htmlFiles) {
    Write-Output "Fixing $($f.Name)..."
    $c = [System.IO.File]::ReadAllText($f.FullName, [System.Text.Encoding]::UTF8)

    # 1. Remove all integrity attributes
    $c = [regex]::Replace($c, '\s+integrity="[^"]*"', '')
    
    # 2. Remove crossorigin on local resources
    $c = [regex]::Replace($c, '(<link[^>]+href="css/[^>]+)\s+crossorigin="anonymous"', '$1')
    $c = [regex]::Replace($c, '(<script[^>]+src="js/[^>]+)\s+crossorigin="anonymous"', '$1')

    # 3. Fix the w-mod-ix3 script so Webflow never hides content
    $c = [regex]::Replace($c, 't=" w-mod-";n\.className\+=t\+"js"', 't=" w-mod-";n.className+=t+"js "+t+"ix3"')

    # 4. Remove the blocking visibility: hidden style block
    $c = [regex]::Replace($c, '(?s)<style>html\.w-mod-js:not\(\.w-mod-ix3\).*?\{visibility: hidden !important;\}</style>', '<!-- Webflow visibility reset removed -->')

    # 5. Ensure head order: bootstrap.min.css -> bootstrap-icons -> webflow-style.css -> custom.css
    # Remove existing customHead block if present to re-order cleanly
    $c = [regex]::Replace($c, '(?s)<!-- Google Fonts -->.*?<!-- Custom Clinic Styles -->\s*<link rel="stylesheet" href="css/custom\.css">\s*</head>', '</head>')

    $headInsert = @"
  <!-- Google Fonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=Schibsted+Grotesk:ital,wght@0,400;0,500;0,600;0,700;0,800;1,400;1,600&display=swap" rel="stylesheet">
  <!-- CSS Framework & Core Styles -->
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <link rel="stylesheet" href="css/bootstrap-icons.min.css">
  <link rel="stylesheet" href="css/webflow-style.css">
  <link rel="stylesheet" href="css/custom.css">
</head>
"@
    # Remove old webflow-style.css link in head so there is no duplicate
    $c = [regex]::Replace($c, '<link href="css/webflow-style\.css"[^>]*>', '')

    $c = [regex]::Replace($c, '</head>', $headInsert)

    [System.IO.File]::WriteAllText($f.FullName, $c, [System.Text.Encoding]::UTF8)
}

Write-Output "All HTML files updated."
