$urlMap = Get-Content "C:\Users\User\.gemini\antigravity\scratch\hoital-kristus-clinic\url_to_local_map.json" -Raw | ConvertFrom-Json
Write-Output "Image map count: $($urlMap.psobject.properties.name.Count)"

$jsMap = Get-Content "C:\Users\User\.gemini\antigravity\scratch\hoital-kristus-clinic\js_to_local_map.json" -Raw | ConvertFrom-Json
Write-Output "JS map count: $($jsMap.psobject.properties.name.Count)"
