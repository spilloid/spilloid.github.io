# Joseph Spillers — Resume Site

The portfolio/resume site for Joseph Spillers, framed around what the work
actually is: **support automation, internal tools, and platform operations
engineering** — a CS-trained support specialist who builds the dashboards,
automation, data pipelines, and workflow systems that make support and
production operations faster, more measurable, and less human-fragile.

It's a lightweight static site built with plain HTML and CSS, plus a small
canvas script for the campfire background. No frameworks — the site is meant
to be a portfolio piece in its own right.

## Structure

The page is organized to read as evidence, not a GitHub dump:

1. **Hero / positioning** — Support Automation & Internal Tools Engineer.
2. **What I Build** — the categories of work, plus an honest note on title vs. scope.
3. **Experience** — professional roles, with One View detailed via bullets.
4. **Professional Systems** (Lane A) — sanitized case studies of employer-owned,
   private internal tooling. No source links; descriptions only.
5. **Public Portfolio** (Lane B) — personal, open-source projects with live
   demos and source on GitHub.
6. **Skills** — grouped by value (support, automation, data, infra, AI).
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
- Feather Icons + Google Fonts

## Local use

Docker:

```bash
docker compose up --build
```

Or just open `docs/index.html` directly in a browser.

## Notes

- Tone is confident, concrete, evidence-driven — receipts over adjectives.
- Lane A descriptions are sanitized: no client names, dealer numbers, internal
  hostnames, or anything that shouldn't be public.
- The deployed version is a resume first and a code flex second.
