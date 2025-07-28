#!/bin/bash
# Pings Vault33 known nodes and logs the result

NODES=("192.168.1.1" "192.168.1.10" "192.168.1.11")  # Customize
LOG=~/vault33/logs/pingstorm-$(date '+%Y%m%d').log

echo "[*] Vault33 Pingstorm - $(date)" > "$LOG"
for IP in "${NODES[@]}"; do
    ping -c 1 $IP &>/dev/null
    if [ $? -eq 0 ]; then
        echo "$IP is UP" >> "$LOG"
    else
        echo "$IP is DOWN" >> "$LOG"
    fi
done
