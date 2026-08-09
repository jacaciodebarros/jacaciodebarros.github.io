# Launch

## What this is

| | |
|---|---|
| Repository name | `jacaciodebarros.github.io` (must match exactly) |
| Public URL | https://jacaciodebarros.github.io/ |
| Publishing source | Branch `main`, folder `/` (root) |
| Build | None. Plain HTML and one CSS file; `.nojekyll` tells Pages to serve the tree as-is. No GitHub Actions workflow is needed. |

## Add the remote and push

Assumes the empty repository `jacaciodebarros.github.io` already exists on GitHub
under the account `jacaciodebarros`, and that Git is authenticated (SSH key or
`gh auth login`). Run from the repository root.

```bash
git remote add origin git@github.com:jacaciodebarros/jacaciodebarros.github.io.git
```

```bash
git push -u origin main
```

For HTTPS instead of SSH, use
`https://github.com/jacaciodebarros/jacaciodebarros.github.io.git` as the remote URL.

## GitHub Pages settings after pushing

In the repository on GitHub, go to **Settings → Pages** and set:

- **Source:** Deploy from a branch
- **Branch:** `main`
- **Folder:** `/ (root)`

Then **Save**. Leave *Custom domain* empty. Turning on *Enforce HTTPS* is
recommended once the certificate is issued (it may take a few minutes to
become selectable).

## Verify the deployment

1. Wait for the green check on the latest commit, or watch **Actions →
   pages-build-deployment**. The first build usually takes 1–2 minutes.
2. Open https://jacaciodebarros.github.io/ and confirm the home page renders with
   the portrait and the cream background (if the page is unstyled, the stylesheet
   did not load).
3. Click through all seven pages: Research, Publications, Books, Teaching, About,
   CV, and back Home.
4. Open one PDF, e.g.
   https://jacaciodebarros.github.io/assets/documents/JAcaciodeBarros-CV.pdf
5. Visit a made-up address, e.g. https://jacaciodebarros.github.io/nope/, and
   confirm the site's own "That page is not here" page appears rather than
   GitHub's generic 404.

## Rollback

Nothing is deleted by a rollback — Pages simply rebuilds from whatever `main`
points at.

To undo the most recent push and republish the previous state:

```bash
git revert --no-edit HEAD && git push origin main
```

To take the site offline entirely, go to **Settings → Pages** and set the source
to **None**. The repository and its history are untouched.
