$res = Invoke-WebRequest -Uri 'http://localhost:3000/our-services.html' -UseBasicParsing
Write-Output "Services Status: $($res.StatusCode), Length: $($res.Content.Length)"
$resAppt = Invoke-WebRequest -Uri 'http://localhost:3000/make-appointment.html' -UseBasicParsing
Write-Output "Appointment Status: $($resAppt.StatusCode), Length: $($resAppt.Content.Length)"
$resContact = Invoke-WebRequest -Uri 'http://localhost:3000/contact.html' -UseBasicParsing
Write-Output "Contact Status: $($resContact.StatusCode), Length: $($resContact.Content.Length)"
