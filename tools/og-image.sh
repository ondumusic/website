#!/bin/sh
# Builds the link preview image (iMessage, Slack, social) from the hero screenshots:
# the Mac window with the iPhone in front of its corner, cropped to 1200x630.
#
#   tools/og-image.sh
#
# Needs ImageMagick (magick). Re-run after replacing the hero screenshots.
set -eu
cd "$(dirname "$0")/.."
shots=static/assets/screenshots
out=static/assets/og-image.jpg

magick -size 1200x630 gradient:'#f7f8fb-#e4e8f2' \
  \( "$shots/mac-main-light.webp" -resize 1080x \) -geometry +20+46 -composite \
  \( "$shots/iphone-albums-framed-light.webp" -resize x560 \) -geometry +866+120 -composite \
  -strip -quality 85 "$out"
echo "Wrote $out"
