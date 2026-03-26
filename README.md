# HFC Guidance Flip Book

A visual, landscape-format flip book walkthrough of Israel Home Front Command (HFC/Pikud Ha'Oref) emergency protocols — featuring Herman the Donkey and Corn the Sloth.

## What's Inside

28-page illustrated guide covering:

- Siren response and shelter procedures
- Go bag essentials
- Shelter-in-place protocols
- Communication during emergencies
- Children and pet safety
- Chemical/biological scenarios
- Post-incident procedures
- Wellness and mental health

## Structure

```
typst/          Typst source file
output/         Compiled PDF
images/         Local image assets
viewer/         Interactive flip-book viewer (HTML)
```

The guide references illustrations from the companion [Israel Wartime Prep Guide](https://github.com/danielrosehill/Israel-Wartime-Prep-Guide) repository.

## Building

Requires [Typst](https://typst.app/) and the sibling `Israel-Wartime-Prep-Guide` repo cloned alongside this one.

```bash
typst compile --root ~/repos typst/flip-book.typ output/flip-book.pdf
```

## Interactive Viewer

The `viewer/` directory contains a self-hosted flip-book viewer that renders PDFs with a page-turning effect using PDF.js and StPageFlip. No build step required — it's a single HTML file.

**Local preview:**

```bash
cd viewer && python3 -m http.server 8080
# Open http://localhost:8080
```

**Load any PDF via query parameter:**

```
viewer/index.html?pdf=https://example.com/any-document.pdf
```

**Embed on any site via iframe:**

```html
<iframe
  src="https://your-domain.com/viewer/?pdf=/path/to/document.pdf"
  width="100%"
  height="700"
  style="border: none;"
  allowfullscreen>
</iframe>
```

Supports keyboard navigation (arrow keys, Home/End), touch/swipe, and fullscreen.

## Authors

- **Daniel Rosehill** — [danielrosehill.com](https://danielrosehill.com) · Jerusalem, Israel
- **Herman & Corn** — Co-hosts of the [My Weird Prompts](https://myweirdprompts.com) podcast
- **Claude (Anthropic)** — Built with Claude Opus 4.6

## License

Community resource based on HFC guidance. Not official government guidance — always follow current Home Front Command instructions.
