$html = [System.IO.File]::ReadAllText("C:\Users\User\.gemini\antigravity\scratch\hoital-kristus-clinic\raw_pages\contact-us.html")

$formPos = $html.IndexOf("<form")
if ($formPos -ge 0) {
    Write-Output "Found form in contact-us.html:"
    $len = [System.Math]::Min(1500, $html.Length - $formPos)
    Write-Output $html.Substring($formPos, $len)
}
