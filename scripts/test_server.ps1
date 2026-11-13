$res = Invoke-WebRequest -Uri 'http://localhost:3000/css/webflow-style.css' -UseBasicParsing
Write-Output "Status: $($res.StatusCode)"
Write-Output "Content-Type: $($res.Headers['Content-Type'])"
Write-Output "CSS Length: $($res.Content.Length)"

$resHtml = Invoke-WebRequest -Uri 'http://localhost:3000/index.html' -UseBasicParsing
Write-Output "HTML Status: $($resHtml.StatusCode)"
Write-Output "HTML Length: $($resHtml.Content.Length)"
