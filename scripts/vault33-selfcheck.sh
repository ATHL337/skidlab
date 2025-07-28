#!/bin/bash
# Vault33 Node Self-Check Script
# Purpose: Print basic identity, role, status, and network info

V33="$HOME/vault33"
ROLE_FILE="$V33/config/vault33-role.conf"
NODE_ID_FILE="$V33/.node-id"
OUT_FILE="$V33/logs/selfcheck-$(date '+%Y%m%d-%H%M%S').txt"

# Output header
echo "=== Vault33 Node Self-Check ===" > "$OUT_FILE"
echo "Timestamp: $(date)" >> "$OUT_FILE"
echo "" >> "$OUT_FILE"

# Node identity
if [[ -f "$NODE_ID_FILE" ]]; then
  echo "Node ID: $(cat $NODE_ID_FILE)" >> "$OUT_FILE"
else
  echo "Node ID: [UNKNOWN]" >> "$OUT_FILE"
fi

# Role
if [[ -f "$ROLE_FILE" ]]; then
  echo "Role: $(cat $ROLE_FILE)" >> "$OUT_FILE"
else
  echo "Role: [UNDEFINED]" >> "$OUT_FILE"
fi

# Host info
echo "Hostname: $(hostname)" >> "$OUT_FILE"
echo "Uptime: $(uptime -p)" >> "$OUT_FILE"
echo "" >> "$OUT_FILE"

# IP Address summary
echo "Network Interfaces:" >> "$OUT_FILE"
ip -4 addr | grep inet | grep -v '127.0.0.1' >> "$OUT_FILE"
echo "" >> "$OUT_FILE"

# Git status (if skidlab is present)
if [[ -d "$V33/skidlab/.git" ]]; then
  echo "Git Repo (skidlab) Status:" >> "$OUT_FILE"
  cd "$V33/skidlab" && git status --short >> "$OUT_FILE"
else
  echo "Git Repo: [NOT FOUND]" >> "$OUT_FILE"
fi

# Result
echo "[*] Self-check complete. Output saved to:"
echo "$OUT_FILE"

