#!/bin/bash
# git-push.sh - Vault33 SkidLab Git Uploader

# Fail on unset vars or errors
set -euo pipefail

REPO_DIR="$(git rev-parse --show-toplevel 2>/dev/null || echo "$PWD")"
cd "$REPO_DIR"

# Check if inside a git repo
if [ ! -d .git ]; then
  echo "[!] Not inside a Git repository. Aborting."
  exit 1
fi

# Ask for commit message
read -rp "Enter commit message: " COMMIT_MSG

# Stage all changes
git add .
echo "[+] Files staged."

# Commit
git commit -m "$COMMIT_MSG"
echo "[+] Commit created."

# Push
BRANCH=$(git rev-parse --abbrev-ref HEAD)
echo "[+] Pushing to branch '$BRANCH'..."
git push origin "$BRANCH"

echo "[Vault33] Git push complete. Stay piped in."
exit 0
