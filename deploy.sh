#!/usr/bin/env bash
# Pushes the site to GitHub (which updates the Pages mirror) and redeploys
# the Railway service that the app and the stores point at.
set -euo pipefail
cd "$(dirname "$0")"

if [[ -n "$(git status --porcelain)" ]]; then
  git add -A
  git commit -m "${1:-Update the site}"
fi
git push

npx -y @railway/cli@latest up --service roadrecall-site --detach
echo "Live at https://roadrecall.up.railway.app"
