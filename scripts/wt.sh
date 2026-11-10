#!/usr/bin/env bash
# usage: ./scripts/wt.sh 12 cash-confirm
set -euo pipefail
N=$1; SLUG=$2
ROOT=$(git rev-parse --show-toplevel)
git fetch origin main
git worktree add "$ROOT/../ts-$N-$SLUG" -b "$N-$SLUG" origin/main
cd "$ROOT/../ts-$N-$SLUG"
# gitignored secrets aren't copied into worktrees, so link them.
# Next.js only loads env files from app/, so link that one too.
if [ -f "$ROOT/.env.local" ]; then
  ln -s "$ROOT/.env.local" .env.local
fi
if [ -f "$ROOT/app/.env.local" ] && [ -d app ]; then
  ln -s "$ROOT/app/.env.local" app/.env.local
fi
[ -d app ] && (cd app && npm install)
echo "Ready: $(pwd)  ->  run: claude"
