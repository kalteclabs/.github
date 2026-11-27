#!/usr/bin/env bash
# Rebuild the FG Falcon CarPlay unit PDFs with headless Chrome.
# Run from a clone of kalteclabs/.github:  cd fg-falcon-carplay-unit/pdf/source && ./build.sh
# Needs Google Chrome or Chromium. Photos and drawings come from ../../images and ../../install.
set -euo pipefail
cd "$(dirname "$0")"
CHROME="${CHROME:-$(command -v google-chrome || command -v chromium || command -v chromium-browser || echo '/Applications/Google Chrome.app/Contents/MacOS/Google Chrome')}"
FLAGS=(--headless=new --no-sandbox --disable-gpu --allow-file-access-from-files --run-all-compositor-stages-before-draw --virtual-time-budget=15000)

for name in install-guide kit-guide; do
  [ -f "$name.html" ] || continue
  src="file://$PWD/$name.html"
  # Check for pages whose content runs into the footer.
  over=$("$CHROME" "${FLAGS[@]}" --dump-dom "$src" 2>/dev/null | grep -o 'data-overflow="[^"]*"' || true)
  [ "$over" = 'data-overflow="[]"' ] || echo "WARNING $name: content runs into the footer on page(s) $over"
  "$CHROME" "${FLAGS[@]}" --no-pdf-header-footer --generate-pdf-document-outline \
    --print-to-pdf="$PWD/../kaltec-fg-$name.pdf" "$src" 2>/dev/null
  echo "built ../kaltec-fg-$name.pdf ($(du -h "../kaltec-fg-$name.pdf" | cut -f1), $(pdfinfo "../kaltec-fg-$name.pdf" 2>/dev/null | awk '/^Pages/{print $2}') pages)"
done
