#!/bin/bash
# grabkit.sh - clone or pull latest from a repo

REPO_URL=$1
DEST_DIR="$HOME/HYPR/Tools/$(basename "$REPO_URL" .git)"

if [ -d "$DEST_DIR/.git" ]; then
  echo "[+] Updating $DEST_DIR"
  git -C "$DEST_DIR" pull
else
  echo "[+] Cloning to $DEST_DIR"
  git clone "$REPO_URL" "$DEST_DIR"
fi
