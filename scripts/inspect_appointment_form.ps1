$html = [System.IO.File]::ReadAllText("C:\Users\User\.gemini\antigravity\scratch\hoital-kristus-clinic\raw_pages\make-appointment.html")

$formPos = $html.IndexOf("<form")
if ($formPos -ge 0) {
    Write-Output "Found form in make-appointment.html:"
    $len = [System.Math]::Min(2500, $html.Length - $formPos)
    Write-Output $html.Substring($formPos, $len)
} else {
    Write-Output "Form not found in make-appointment.html"
}
