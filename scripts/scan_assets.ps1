$rawDir = "C:\Users\User\.gemini\antigravity\scratch\hoital-kristus-clinic\raw_pages"
$files = Get-ChildItem -Path $rawDir -Filter "*.html"

$imgUrls = [System.Collections.Generic.HashSet[string]]::new()
$cssUrls = [System.Collections.Generic.HashSet[string]]::new()
$jsUrls = [System.Collections.Generic.HashSet[string]]::new()

foreach ($f in $files) {
    $content = [System.IO.File]::ReadAllText($f.FullName)
    
    # img src
    $imgMatches = [regex]::Matches($content, '<img[^>]+src=["'']([^"'']+)["'']')
    foreach ($m in $imgMatches) {
        $u = $m.Groups[1].Value
        if ($u -notmatch '^data:') { [void]$imgUrls.Add($u) }
    }
    
    # img srcset
    $srcsetMatches = [regex]::Matches($content, 'srcset=["'']([^"'']+)["'']')
    foreach ($m in $srcsetMatches) {
        $parts = $m.Groups[1].Value -split ','
        foreach ($p in $parts) {
            $u = ($p.Trim() -split '\s+')[0]
            if ($u -and $u -notmatch '^data:') { [void]$imgUrls.Add($u) }
        }
    }
    
    # icons & other links
    $linkMatches = [regex]::Matches($content, '<link[^>]+href=["'']([^"'']+)["'']')
    foreach ($m in $linkMatches) {
        $u = $m.Groups[1].Value
        if ($u -match '\.css') { [void]$cssUrls.Add($u) }
        elseif ($u -match '\.(png|jpg|jpeg|webp|ico|svg)') { [void]$imgUrls.Add($u) }
    }

    # scripts
    $sMatches = [regex]::Matches($content, '<script[^>]+src=["'']([^"'']+)["'']')
    foreach ($m in $sMatches) {
        $u = $m.Groups[1].Value
        [void]$jsUrls.Add($u)
    }
}

Write-Output "Unique CSS URLs found: $($cssUrls.Count)"
$cssUrls | ForEach-Object { Write-Output "CSS: $_" }

Write-Output "Unique JS URLs found: $($jsUrls.Count)"
$jsUrls | ForEach-Object { Write-Output "JS: $_" }

Write-Output "Unique Image URLs found: $($imgUrls.Count)"

# Save lists to json
@{
    css = @($cssUrls)
    js = @($jsUrls)
    images = @($imgUrls)
} | ConvertTo-Json -Depth 3 | Out-File "C:\Users\User\.gemini\antigravity\scratch\hoital-kristus-clinic\assets_list.json" -Encoding utf8
