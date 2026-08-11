#!/bin/sh
set -eu

ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
PORT=${CV_PDF_PORT:-8765}
OUT="$ROOT/assets/documents/JAcaciodeBarros-CV.pdf"

if ! command -v weasyprint >/dev/null 2>&1; then
  echo "WeasyPrint is required to regenerate the CV PDF." >&2
  echo "Install it, then run this script again." >&2
  exit 1
fi

cd "$ROOT"
python3 -m http.server "$PORT" --bind 127.0.0.1 >/tmp/jacacio-cv-http.log 2>&1 &
SERVER_PID=$!
trap 'kill "$SERVER_PID" 2>/dev/null || true' EXIT INT TERM
sleep 1
weasyprint "http://127.0.0.1:$PORT/cv/" "$OUT"
echo "Generated $OUT"
