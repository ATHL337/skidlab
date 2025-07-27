#!/bin/bash
echo "[+] Available Kits:"
echo "1) Vault33 Demo Scripts"
echo "2) OPFORGE Payload Pack"
echo "3) HYPR Skid Kit"

read -p "Choose one: " choice

case $choice in
  1) curl -L https://heavyhacks.com/vault33-demo.sh -o ~/HYPR/Tools/vault33-demo.sh ;;
  2) curl -L https://heavyhacks.com/opforge-payloads.tar.gz -o ~/HYPR/Tools/opforge-payloads.tar.gz ;;
  3) curl -L https://heavyhacks.com/skidkit.sh -o ~/HYPR/Tools/skidkit.sh ;;
  *) echo "Invalid selection" ;;
esac
