#!/bin/bash
# Vault33 Update Script - HYPR-LITE and siblings
# Pulls latest from skidlab GitHub repo and updates local tools

set -e

V33="$HOME/vault33"
REPO_DIR="$V33/skidlab"
LOGFILE="$V33/logs/update-$(date '+%Y%m%d-%H%M%S').log"

echo "[*] Vault33 Node Update :: $(date)" | tee "$LOGFILE"

# Step 1: Confirm skidlab repo exists
if [ ! -d "$REPO_DIR/.git" ]; then
  echo "[!] ERROR: Git repo not found in $REPO_DIR" | tee -a "$LOGFILE"
  exit 1
fi

# Step 2: Pull latest updates
cd "$REPO_DIR"
echo "[*] Pulling latest from GitHub..." | tee -a "$LOGFILE"
git pull origin main 2>&1 | tee -a "$LOGFILE"

# Step 3: Sync selected files
echo "[*] Syncing tool scripts..." | tee -a "$LOGFILE"

TOOLS=(git_push.sh vault33-pingstorm.sh vault33-selfcheck.sh vault33-harden.sh update-all.sh)

for tool in "${TOOLS[@]}"; do
    SRC="$REPO_DIR/$tool"
    DST="$V33/bin/${tool//_/-}"
    if [[ -f "$SRC" ]]; then
        cp -u "$SRC" "$DST"
        chmod +x "$DST"
        echo "[+] Synced $tool" | tee -a "$LOGFILE"
    else
        echo "[!] $tool not found in repo — skipped" | tee -a "$LOGFILE"
    fi
done

# Step 4: Update version file
echo "Last update: $(date)" > "$V33/version.txt"

# Step 5: Run selfcheck if available
if [[ -f "$V33/bin/vault33-selfcheck.sh" ]]; then
    echo "[*] Running selfcheck..." | tee -a "$LOGFILE"
    "$V33/bin/vault33-selfcheck.sh" >> "$LOGFILE" 2>&1
else
    echo "[!] Selfcheck script missing — skipping" | tee -a "$LOGFILE"
fi

echo "[✔] Update complete. Log saved to $LOGFILE"
