#!/bin/bash
echo "[+] Starting HYPR-LITE Bootstrap Setup..."
 
# Update & install core tools
sudo apt update && sudo apt install -y \
neofetch htop tree curl git \
usbimager mintstick gparted p7zip-full unrar \
brasero handbrake vlc libdvd-pkg \
ddrescue testdisk clamav clamtk \
net-tools nmap wireshark iperf3 \
python3-setuptools metasploit-framework beef-xss
 
# Reconfigure DVD decryption
sudo dpkg-reconfigure libdvd-pkg
 
# Create HYPR folder structure
echo "[+] Creating folders under ~/HYPR/"
mkdir -p ~/HYPR/{DVD-Rips,ISO-Drops,USB-Staging,Payloads,SkidLab,Forensics,Vault33,Tools}
 
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
 
echo "[+] HYPR-LITE setup complete."
