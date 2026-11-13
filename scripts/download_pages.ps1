$pages = @{
    "index" = "https://fycare.webflow.io/"
    "our-projects" = "https://fycare.webflow.io/our-projects"
    "blog" = "https://fycare.webflow.io/blog"
    "make-appointment" = "https://fycare.webflow.io/make-appointment"
    "our-services" = "https://fycare.webflow.io/our-services"
    "contact-us" = "https://fycare.webflow.io/contact-us"
    "about" = "https://fycare.webflow.io/about"
    "our-doctor" = "https://fycare.webflow.io/our-doctor"
}

$targetDir = "C:\Users\User\.gemini\antigravity\scratch\hoital-kristus-clinic\raw_pages"
if (!(Test-Path $targetDir)) { New-Item -ItemType Directory -Path $targetDir -Force }

foreach ($key in $pages.Keys) {
    $url = $pages[$key]
    Write-Output "Fetching $key from $url..."
    try {
        $resp = Invoke-WebRequest -Uri $url -UseBasicParsing -UserAgent "Mozilla/5.0"
        $outFile = Join-Path $targetDir "$key.html"
        [System.IO.File]::WriteAllText($outFile, $resp.Content, [System.Text.Encoding]::UTF8)
        Write-Output "Saved $outFile ($($resp.Content.Length) bytes)"
    } catch {
        Write-Output "Error fetching $url : $_"
    }
}
