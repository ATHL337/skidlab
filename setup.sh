#!/bin/bash

echo "[+] Starting HYPR-LITE Bootstrap Setup..."

# Ensure script is not run as root
if [ "$EUID" -eq 0 ]; then
  echo "[-] Please do not run this script as root. Run it as your regular user."
  exit 1
fi

# Update & install core tools
sudo apt update && sudo apt install -y \
neofetch htop tree curl git \
mintstick gparted p7zip-full unrar \
brasero handbrake vlc libdvd-pkg \
testdisk clamav clamtk \
net-tools nmap wireshark iperf3 \
python3-setuptools

# Reconfigure DVD decryption
sudo dpkg-reconfigure libdvd-pkg

# Create HYPR folder structure
echo "[+] Creating folders under ~/HYPR/"
mkdir -p ~/HYPR/{DVD-Rips,ISO-Drops,USB-Staging,Payloads,SkidLab,Forensics,Vault33,Tools}

# Optional: Generate SSH key
if [ ! -f ~/.ssh/id_ed25519 ]; then
  echo "[+] Generating SSH key..."
  ssh-keygen -t ed25519 -C "hypr-lite@$(hostname)" -f ~/.ssh/id_ed25519 -N ""
fi

# Optional: Bash aliases for SkidLab flavor
cat << 'EOF' >> ~/.bash_aliases

alias scanlan='nmap -sn $(ip route | awk "/src/ {print \$1}")'
alias sniff='sudo tcpdump -i wlan0 -nn'
alias burniso='brasero --image-to-disc'
alias forgeusb='mintstick'
alias skid='cd ~/HYPR/SkidLab'
EOF

echo "source ~/.bash_aliases" >> ~/.bashrc

# MOTD Flavor (optional)
cat << 'EOF' | sudo tee /etc/motd

██╗  ██╗██╗   ██╗██████╗ ██████╗       ██╗     ██╗████████╗███████╗
██║  ██║╚██╗ ██╔╝██╔══██╗██╔══██╗      ██║     ██║╚══██╔══╝██╔════╝
███████║ ╚████╔╝ ██████╔╝██████╔╝█████╗██║     ██║   ██║   █████╗  
██╔══██║  ╚██╔╝  ██╔═══╝ ██╔══██╗╚════╝██║     ██║   ██║   ██╔══╝  
██║  ██║   ██║   ██║     ██║  ██║      ███████╗██║   ██║   ███████╗
╚═╝  ╚═╝   ╚═╝   ╚═╝     ╚═╝  ╚═╝      ╚══════╝╚═╝   ╚═╝   ╚══════╝
                                                                   
         HYPR-LITE // VAIO-Class Tactical Node
EOF

# Bash prompt touch-up
echo "neofetch" >> ~/.bashrc

# Tool version check
echo "[+] Installed tool versions:"
neofetch --version
git --version
nmap --version | head -n1
wireshark --version | head -n1

echo "[+] HYPR-LITE setup complete."
