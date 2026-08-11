# jacaciodebarros.github.io

Academic site for J. Acacio de Barros, Professor of Philosophy, San Francisco
State University. Published with GitHub Pages from the repository root, served at
`https://jacaciodebarros.github.io/`.

## Approach

Plain static HTML and one CSS file. No framework, no build step, no JavaScript,
and no external network requests (fonts are system stacks). Editing a page means
opening the `.html` file.

## Structure

```
index.html            Home
404.html              Served by GitHub Pages for unknown addresses
research/             Research
publications/         Publications
books/                Books
teaching/             Teaching
about/                About
cv/                   Canonical HTML CV
assets/css/site.css   The whole stylesheet
assets/images/        Portrait derivatives
assets/documents/     Printable CV PDF, and papers/ talks/ theses/
.nojekyll             Serve files as-is; do not run Jekyll
LAUNCH.md             Deployment notes
```

## Conventions

- **Links are root-relative** (`/research/`, `/assets/css/site.css`). This is
  correct for a GitHub Pages *user* site, which is served from the domain root.
  It also means the pages will not render correctly if opened directly from disk
  with `file://` — run a local server instead:

  ```
  python3 -m http.server 4000
  ```

  then open `http://localhost:4000/`.

- **The header and footer are duplicated in each page.** With seven pages and no
  build step this is the cheaper trade. If a nav item is added or renamed, update
  every `.html` file, and move `aria-current="page"` to the matching link.

- **Colors and type live in `:root`** at the top of `site.css`. The three text
  colors are checked against the cream background: ink 14.4:1, muted ink 6.6:1,
  gold 5.6:1 — all at or above the WCAG AA threshold of 4.5:1.

## Portrait

`assets/images/portrait-acacio-de-barros-photo-*.{webp,jpg}` and
`assets/images/social-card-acacio-de-barros-1200x630.jpg` are built from
`asset-source/portrait/Photo on 3-26-25 at 17.54.jpg` in the parent preservation
repository, which holds the untouched original. The build is
`asset-source/portrait/derived/build_portrait_assets.py`: a single 960×960 crop
at x=320 of the 1440×960 source, then resizes and encodes. Nothing else is done
to the photograph — no cut-out, no synthesized background, no retouching.

The earlier transparent cut-out derivatives have been removed. The portrait is
now an ordinary rectangular photograph with its own background, so it needs no
panel, border, or shadow to sit on the cream. Rebuild rather than edit the
derivatives if the framing needs to change.


## Curriculum vitae

`cv/index.html` is the canonical CV. `assets/documents/JAcaciodeBarros-CV.pdf` is
a printable derivative generated from the same HTML and print CSS. Substantive CV
changes should be made in the HTML/source data first so the two versions do not
drift apart.

Regenerate the PDF from the repository root with:

```
./scripts/generate_cv_pdf.sh
```

The script serves the site locally and renders `/cv/` with WeasyPrint, so root-relative assets and the repository's `@media print` rules are used. WeasyPrint must be installed on the machine that regenerates the PDF.
