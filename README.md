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

`assets/images/portrait-acacio-de-barros-*.{webp,png}` are derived from
`asset-source/portrait/` in the parent preservation repository, which holds the
untouched original. The current public repository contains only the transparent
cut-out derivatives. The site now places that derivative inside a restrained
photographic panel rather than letting the cut-out dissolve directly into the page.
A future replacement should be made from the untouched source photograph, not by
further altering the derivative.


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
