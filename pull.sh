#!/bin/bash
# pull.sh - Grab a remote file into ~/HYPR/Tools or SkidLab

DEST=${2:-"$HOME/HYPR/Tools"}
echo "[+] Pulling from $1 into $DEST"
mkdir -p "$DEST"
wget -q --show-progress -P "$DEST" "$1"
