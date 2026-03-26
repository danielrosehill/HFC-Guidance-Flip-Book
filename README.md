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
```

The guide references illustrations from the companion [Israel Wartime Prep Guide](https://github.com/danielrosehill/Israel-Wartime-Prep-Guide) repository.

## Building

Requires [Typst](https://typst.app/) and the sibling `Israel-Wartime-Prep-Guide` repo cloned alongside this one.

```bash
typst compile --root ~/repos typst/flip-book.typ output/flip-book.pdf
```

## Authors

- **Daniel Rosehill** — [danielrosehill.com](https://danielrosehill.com) · Jerusalem, Israel
- **Herman & Corn** — Co-hosts of the [My Weird Prompts](https://myweirdprompts.com) podcast
- **Claude (Anthropic)** — Built with Claude Opus 4.6

## License

Community resource based on HFC guidance. Not official government guidance — always follow current Home Front Command instructions.
