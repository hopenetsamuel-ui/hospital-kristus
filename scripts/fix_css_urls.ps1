$cssPath = "C:\Users\User\.gemini\antigravity\scratch\hoital-kristus-clinic\css\webflow-style.css"
$css = [System.IO.File]::ReadAllText($cssPath, [System.Text.Encoding]::UTF8)

$css = $css.Replace("https://d3e54v103j8qbb.cloudfront.net/static/custom-checkbox-checkmark.589d534424.svg", "../images/custom-checkbox-checkmark.svg")
$css = $css.Replace("https://cdn.prod.website-files.com/6a6b05680d42218e36607649/6a6c017610053482fdbc154d_page-tt-about.webp", "../images/6a6c017610053482fdbc154d_page-tt-about.webp")
$css = $css.Replace("https://cdn.prod.website-files.com/6a6b05680d42218e36607649/6a9a2722145516f68385b4b8_Ellipse.png", "../images/6a9a2722145516f68385b4b8_Ellipse.png")

[System.IO.File]::WriteAllText($cssPath, $css, [System.Text.Encoding]::UTF8)
Write-Output "Updated webflow-style.css asset references"
