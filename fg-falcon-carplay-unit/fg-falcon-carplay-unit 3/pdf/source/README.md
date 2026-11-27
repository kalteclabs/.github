# FG Falcon CarPlay unit: PDF build source

The printable install guide (`../kaltec-fg-install-guide.pdf`) is built from `install-guide.html` and `book.css` with headless Chrome. The photos and drawings come straight from this repo (`../../images/` and `../../install/`), so nothing is duplicated.

## Rebuild

```
cd fg-falcon-carplay-unit/pdf/source
./build.sh
```

Needs Google Chrome or Chromium (set `CHROME=/path/to/chrome` if it isn't found) and `pdfinfo` for the page count (optional). The script warns if any page's content runs into the footer.

## When a guide changes

The PDF follows the markdown in [kalteclabs/fg-falcon-carplay-unit](https://github.com/kalteclabs/fg-falcon-carplay-unit): install-guide.md, parts-list.md, free-bracket.md and the Kits and parts section of README.md.

1. Change the matching page in `install-guide.html`. Each page is one `<section class="page">`, with a comment naming it.
2. Bump the version and date on the cover and the back page.
3. Run `./build.sh`, check the pages, and upload the new PDF over the old one (same filename, so every download link keeps working).

## What's here

| Path | What |
| --- | --- |
| `install-guide.html` | The guide, one section per A4 page |
| `book.css` | Print styles (KALTEC style guide v1.0: Display caps headings, Archivo 10 pt body, IBM Plex Mono for wire names, pine accent, radius 0, 12° chips) |
| `build.sh` | Renders the PDF(s) into `../` |
| `fonts/` | KALTEC Display, Archivo, IBM Plex Mono, each with its SIL OFL 1.1 licence |
| `brand/` | KALTEC logo and mark (SVG). Not open-licensed: use unmodified to refer to KALTEC |
| `qr/` | QR codes: the repo, kaltec.au/guide, kaltec.au |

**KALTEC · CC BY-SA 4.0 · [github.com/kalteclabs/fg-falcon-carplay-unit](https://github.com/kalteclabs/fg-falcon-carplay-unit)**
