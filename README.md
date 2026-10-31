# Joseph Spillers — Resume Site

The portfolio/resume site for Joseph Spillers, positioned as a **software
engineer for internal tools and platform work**: the software support and
operations teams run on, shipped like a product (signed, verified releases;
cross-model review; tests shown to fail on the old code).

It's a lightweight static site built with plain HTML and CSS, plus a small
canvas script for the campfire background. No frameworks — the site is meant
to be a portfolio piece in its own right.

## Structure

The page is organized to read as evidence, not a GitHub dump:

1. **Hero / positioning** — Software Engineer · Internal Tools & Platform, a proof strip
   (project count, signed builds, cross-model review), and a sticky in-page nav.
2. **Work** — *Selected work* (four flagship cards: AnchorDesk, SpoolSmith, kvm-it,
   flyw8t), then compact cards for every other project, grouped as Spillers Technology
   products, personal projects (per the board's portfolio map) and AI & agent engineering,
   then the engineering lab. Each card shows the app's icon in a shared tile
   (`img/apps/`; projects without a mark get a monogram) and its released version, so
   **update the version pills on release**.
3. **How I Ship** — six engineering practices with evidence, and an honest note on title
   vs. scope.
4. **Experience** — Moser Consulting first (Service Desk Technician, Aug 2026–present),
   emphasizing enterprise systems, software development, endpoint security and MCP
   integrations, followed by earlier roles including One View.
5. **Professional Systems** (Lane A) — sanitized case studies of employer-owned, private
   internal tooling. No source links; descriptions only.
6. **Skills** — grouped by value (support, automation, product, data, infra, AI/agents).
7. **Education.**

The two project lanes are kept strictly separate by design: internal/private
work and public repos never share a grid.

## Files

- `src/` — main site files used by the Docker/Nginx setup.
- `docs/` — static files served by GitHub Pages (the deployed copy) at
  `https://spilloid.github.io/`. (`spillerstech.us` now belongs to the
  [Spillers-Technology](https://github.com/Spillers-Technology) org, not this site.)
- `index.html` at the repo root — tiny redirect entry point.
- `Dockerfile` / `docker-compose.yml` — Nginx container for local serving.

`src/` and `docs/` are kept in sync. Edit the deployed copy in `docs/`, then
mirror the same changes into `src/` (or copy `docs/index.html` and
`docs/style.css` over).

## Stack

- HTML / CSS
- A little vanilla canvas (the campfire background)
- Nginx (for the Docker path)
- Feather Icons (pinned to 4.29.2) + Google Fonts

## Local use

Docker:

```bash
docker compose up --build
```

Or just open `docs/index.html` directly in a browser.

## Notes

- Project cards are generated from the repos, not memory: check the repo README, LICENSE, and latest release before changing a stack line, license, or maturity pill. Twove and pool_sim have no LICENSE file, so no license is claimed.
- OpenReplay session replay runs on https only and is disclosed in the footer and at spillerstech.us/privacy.html.
- Tone is confident, concrete, evidence-driven — receipts over adjectives. No superlatives,
  no claim made twice.
- Personal projects are not Spillers Technology products and don't appear on the storefront;
  don't describe them as used at any employer.
- `resume.html` (repo root) is the print source and is not served by Pages. Regenerate
  both linked downloads after editing it with `powershell.exe -NoProfile -ExecutionPolicy
  Bypass -File .\scripts\build-resume-pdfs.ps1` (requires Chrome on Windows). The script
  checks that `docs/Joseph_Spillers_Resume.pdf` is one page and
  `docs/Joseph_Spillers_Resume_Extended.pdf` is two pages. The short version focuses on
  recent roles, skills and education; the extended version adds earlier experience
  and projects.
- Lane A descriptions are sanitized: no client names, dealer numbers, internal
  hostnames, or anything that shouldn't be public.
- The deployed version is a resume first and a code flex second.
