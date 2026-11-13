$rootDir = "C:\Users\User\.gemini\antigravity\scratch\hoital-kristus-clinic"
$htmlFiles = Get-ChildItem -Path $rootDir -Filter "*.html"

foreach ($f in $htmlFiles) {
    if ($f.Name -eq "home_raw.html" -or $f.Name -eq "service_cards.html") {
        Remove-Item $f.FullName -Force
        continue
    }
    
    $content = [System.IO.File]::ReadAllText($f.FullName, [System.Text.Encoding]::UTF8)
    
    # Replace remaining external links
    $content = $content.Replace("https://fycare.webflow.io/401", "404.html")
    $content = $content.Replace("https://fycare.webflow.io/404", "404.html")
    $content = $content.Replace("href=""/style-guide""", "href=""index.html""")
    $content = $content.Replace("href=""/licenses""", "href=""index.html""")
    $content = $content.Replace("href=""/changelog""", "href=""index.html""")

    # Ensure Address is consistently 101 Eliparanwo, Port Harcourt
    $content = [regex]::Replace($content, 'Suite 502, Lexington Ave, NY', '101 Eliparanwo, Port Harcourt')
    $content = [regex]::Replace($content, 'Lexington Ave, NY', '101 Eliparanwo, Port Harcourt')
    $content = [regex]::Replace($content, 'NY 10001', 'Port Harcourt')
    
    [System.IO.File]::WriteAllText($f.FullName, $content, [System.Text.Encoding]::UTF8)
}

# Move scripts to scripts folder
$scriptDir = Join-Path $rootDir "scripts"
if (!(Test-Path $scriptDir)) { New-Item -ItemType Directory -Path $scriptDir -Force }
Get-ChildItem -Path $rootDir -Filter "*.ps1" | Move-Item -Destination $scriptDir -Force
Get-ChildItem -Path $rootDir -Filter "*.py" | Move-Item -Destination $scriptDir -Force

Write-Output "Cleaned and finalized files."
