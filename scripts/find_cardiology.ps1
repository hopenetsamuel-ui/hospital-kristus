$servicesHtml = [System.IO.File]::ReadAllText("C:\Users\User\.gemini\antigravity\scratch\hoital-kristus-clinic\raw_pages\our-services.html")

$pos = $servicesHtml.IndexOf("Cardiology")
if ($pos -ge 0) {
    Write-Output "Found Cardiology at ${pos}:"
    $start = [System.Math]::Max(0, $pos - 400)
    $len = [System.Math]::Min(1500, $servicesHtml.Length - $start)
    Write-Output $servicesHtml.Substring($start, $len)
} else {
    Write-Output "Cardiology not found"
}
