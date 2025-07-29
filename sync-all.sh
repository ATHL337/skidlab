#!/bin/bash
# Sync tools/scripts to all known Vault33 nodes

NODES=("192.168.1.29" "192.168.1.8")  # Replace with actual IPs or aliases

for NODE in "${NODES[@]}"; do
  echo "[*] Syncing to $NODE..."
  rsync -avz ~/vault33/skidlab/scripts/ hypradmin@$NODE:~/vault33/bin/
done
