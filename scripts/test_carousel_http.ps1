$res = Invoke-WebRequest -Uri 'http://localhost:3000/index.html' -UseBasicParsing
$html = $res.Content

$hasCarouselWrapper = $html.Contains('class="hk-carousel-wrapper"')
$hasTrack = $html.Contains('id="practiceCarouselTrack"')
$hasDots = $html.Contains('id="practiceCarouselDots"')
$dot1 = $html.Contains('data-slide="0"')
$dot2 = $html.Contains('data-slide="1"')
$dot3 = $html.Contains('data-slide="2"')

Write-Output "HTTP 200 OK: $($res.StatusCode)"
Write-Output "Carousel Wrapper: $hasCarouselWrapper"
Write-Output "Carousel Track: $hasTrack"
Write-Output "Three Navigation Dots present: $($dot1 -and $dot2 -and $dot3)"

# Check our-services.html as well
$resSrv = Invoke-WebRequest -Uri 'http://localhost:3000/our-services.html' -UseBasicParsing
$htmlSrv = $resSrv.Content
$srvHasDots = $htmlSrv.Contains('id="practiceCarouselDots"')
Write-Output "Services page Three Navigation Dots: $srvHasDots"
