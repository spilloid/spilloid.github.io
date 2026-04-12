# Joseph Spillers Resume Site

This repo is my resume site on the internet, which is a very normal and not-at-all dramatic place to keep a career summary.

It is a lightweight static site built with plain HTML and CSS, with just enough flourish to feel human.

## What's here

- `src/` contains the main site files used by the Docker/Nginx setup.
- `docs/` contains the static files for GitHub Pages-style hosting.
- `index.html` at the repo root exists as a tiny entry point.
- `Dockerfile` serves the site with Nginx.
- `docker-compose.yml` includes a simple container setup for deployment.

## Stack

- HTML
- CSS
- Nginx
- A headshot
- Mild audacity

## Local use

If you want to run it in Docker:

```bash
docker compose up --build
```

Then open the site through whatever host/port mapping your environment provides.

If you just want to edit the page, the main content lives in:

- `src/index.html`
- `src/style.css`

If you're publishing through GitHub Pages, make sure the matching files in `docs/` stay in sync too.

## Notes

- The site is intentionally simple, readable, and fast.
- Icons are provided with Feather Icons.
- Fonts are loaded from Google Fonts.
- The deployed version is meant to be a resume first and a code flex second.

## Why this repo exists

Because sending people a link is easier than attaching seventeen slightly different resume files named things like `Resume-Final-ActuallyFinal2.pdf`.
