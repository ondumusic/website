#!/bin/sh
# Puts an iPhone screenshot inside Apple's iPhone 17 bezel and saves it as WebP for the site.
#
#   tools/frame-iphone.sh <screenshot.png> <bezel.png> <output.webp>
#
# e.g. tools/frame-iphone.sh "../screenshots/ios/ios album list dark.png" \
#        "../screenshots/iPhone 17/iPhone 17 - Mist Blue - Portrait.png" \
#        static/assets/screenshots/iphone-albums-framed-dark.webp
#
# Needs ImageMagick (magick) and cwebp. Screenshots must be 1206x2622 (iPhone 17 / 16 Pro);
# the bezel's screen opening sits at +72+69.
set -eu

shot=$1; bezel=$2; out=$3
tmp=$(mktemp -d); trap 'rm -rf "$tmp"' EXIT

# The screen opening: the bezel's transparent pixels, minus the transparent area outside it
magick "$bezel" -alpha extract -negate -fill black -draw "color 0,0 floodfill" "$tmp/mask.png"

magick -size 1350x2760 xc:none "$shot" -geometry +72+69 -composite \
  "$tmp/mask.png" -compose CopyOpacity -composite \
  -compose Over "$bezel" -composite \
  -resize 640x -strip "PNG32:$tmp/framed.png"

cwebp -quiet -q 86 -alpha_q 100 -exact -metadata none "$tmp/framed.png" -o "$out"
echo "Wrote $out"
