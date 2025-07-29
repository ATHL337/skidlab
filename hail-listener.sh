#!/bin/bash
PORT=9911
LOG=~/vault33/logs/hail-inbound.log

mkdir -p ~/vault33/logs
echo "[*] Listening for Vault33 node pings on port $PORT..."

while true; do
  nc -lvkp $PORT >> "$LOG"
done
