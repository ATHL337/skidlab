#!/bin/bash
# Vault33: HYPR-LITE Field Node Hardening Script
# Purpose: Clean, tag, and prep the node for field readiness

set -e

V33="$HOME/vault33"

echo "[*] Hardening HYPR-LITE Vault33 node..."

# --- Ensure standard folders exist ---
mkdir -p "$V33"/{bin,config,logs,media/{iso,dvd_rips,images},themes,sync/{inbound,outbound},logs/forensics}
touch "$V33/version.txt"

# --- Add node ID and provisioning stamp ---
echo "HYPR-LITE::VAIO-Class::Terminal" > "$V33/.node-id"
date > "$V33/.provisioned"

# --- Fix permissions and executable flags ---
chmod +x "$V33"/bin/*.sh 2>/dev/null || echo "[!] No executable scripts found yet in bin/"

# --- Remove deprecated/duplicate directories ---
rm -rf "$HOME/HYPR" "$HOME/Downloads/hypr-lite-setup.sh" "$HOME/c.sh" "$HOME/custom.txt"

# --- Add .gitignore to volatile folders ---
echo "*" > "$V33/logs/.gitignore"
echo "!.gitignore" >> "$V33/logs/.gitignore"
cp "$V33/logs/.gitignore" "$V33/logs/forensics/.gitignore"

echo "*" > "$V33/sync/inbound/.gitignore"
echo "!.gitignore" >> "$V33/sync/inbound/.gitignore"
cp "$V33/sync/inbound/.gitignore" "$V33/sync/outbound/.gitignore"

# --- Create MOTD if absent ---
echo "[HYPR-LITE::VAIO-Class::Terminal]" | sudo tee /etc/motd

# --- Generate initial selfcheck ---
"$V33/bin/vault33-selfcheck.sh" > "$V33/logs/selfcheck.txt" 2>/dev/null || echo "[!] Selfcheck not available yet."

echo "[✔] HYPR-LITE node hardened and ready."
