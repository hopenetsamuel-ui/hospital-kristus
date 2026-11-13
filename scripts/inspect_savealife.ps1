try {
    $resp = Invoke-WebRequest -Uri "https://www.savealifehospital.com/" -UseBasicParsing -UserAgent "Mozilla/5.0"
    $html = $resp.Content
    [System.IO.File]::WriteAllText("C:\Users\User\.gemini\antigravity\scratch\hoital-kristus-clinic\scripts\savealife_home.html", $html, [System.Text.Encoding]::UTF8)
    Write-Output "Downloaded savealife home, length: $($html.Length)"

    # Look for header or nav
    $headerMatch = [regex]::Match($html, '(?s)<header[^>]*>.*?</header>')
    if ($headerMatch.Success) {
        Write-Output "Header found (len $($headerMatch.Value.Length)):"
        [System.IO.File]::WriteAllText("C:\Users\User\.gemini\antigravity\scratch\hoital-kristus-clinic\scripts\savealife_header.html", $headerMatch.Value, [System.Text.Encoding]::UTF8)
        Write-Output $headerMatch.Value.Substring(0, [System.Math]::Min(1500, $headerMatch.Value.Length))
    } else {
        # Check nav
        $navMatches = [regex]::Matches($html, '(?s)<nav[^>]*>.*?</nav>')
        Write-Output "Found $($navMatches.Count) nav tags"
        foreach ($n in $navMatches) {
            Write-Output $n.Value.Substring(0, [System.Math]::Min(1000, $n.Value.Length))
            Write-Output "---"
        }
    }
} catch {
    Write-Output "Error: $_"
}
