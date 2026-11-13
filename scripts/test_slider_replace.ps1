$html = [System.IO.File]::ReadAllText('C:\Users\User\.gemini\antigravity\scratch\hoital-kristus-clinic\index.html', [System.Text.Encoding]::UTF8)

# Replace the w-slider and w-slider-mask wrapper around practice areas with clean grid container
$oldSliderStart = '(?s)<div[^>]*class="specialties-slider w-slider"[^>]*>\s*<div class="slider-mask w-slider-mask">\s*<div class="slider-service-item _3cl w-slide">'

$newGridWrapper = '<div class="practice-areas-wrapper-grid">'

$html = [regex]::Replace($html, $oldSliderStart, $newGridWrapper)

# Now check where the slider closes
# The old closing was: </div></div></div></div><a href="our-services.html" class="practice-button w-inline-block">
$oldSliderEnd = '</div>\s*</div>\s*</div>\s*</div>\s*</div>\s*<a href="our-services.html"'
# In the new structure, we need:
# </div> (closes list)
# </div> (closes grid)
# </div> (closes practice-areas-wrapper-grid)
# </div> (closes container/section)
# Let's inspect the exact closing tags around our-services.html link in index.html

[System.IO.File]::WriteAllText('C:\Users\User\.gemini\antigravity\scratch\hoital-kristus-clinic\scripts\test_slider_replace.txt', "ready")
