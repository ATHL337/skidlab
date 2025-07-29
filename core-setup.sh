#!/bin/bash

echo "[+] Starting HYPR-CORE Bootstrap Setup..."

# Prevent running as root
if [ "$EUID" -eq 0 ]; then
  echo "[-] Do not run this as root. Run as your main user (e.g., hypradmin)."
  exit 1
fi

# Update & install core CLI tools
sudo apt update && sudo apt install -y \
neofetch git rsync netcat-openbsd unzip curl tree htop

# Create Vault33 structure
echo "[+] Creating ~/vault33 folders"
mkdir -p ~/vault33/{bin,config,logs,media/{iso,dvd_rips,images},themes,sync/{inbound,outbound},logs/forensics}

# Create identity tags
echo "controller" > ~/vault33/config/vault33-role.conf
echo "HYPR-CORE::Controller::$(hostname)" > ~/vault33/.node-id
date > ~/vault33/.provisioned

# Generate SSH key if not already present
if [ ! -f ~/.ssh/id_ed25519 ]; then
  echo "[+] Generating SSH key..."
  ssh-keygen -t ed25519 -C "hypr-core@$(hostname)" -f ~/.ssh/id_ed25519 -N ""
fi

# Bash aliases for controller ops
cat << 'EOF' >> ~/.bash_aliases

alias tailhail='tail -f ~/vault33/logs/hail-inbound.log'
alias syncnodes='bash ~/vault33/bin/sync-all.sh'
alias corebin='cd ~/vault33/bin'
alias corelog='cd ~/vault33/logs'
EOF

# Source aliases and show neofetch on login
echo "source ~/.bash_aliases" >> ~/.bashrc
echo "neofetch" >> ~/.bashrc

# Custom MOTD
cat << 'EOF' | sudo tee /etc/motd

██╗  ██╗██╗   ██╗██████╗ ██████╗        ██████╗ ██████╗ ██████╗ ███████╗
██║  ██║╚██╗ ██╔╝██╔══██╗██╔══██╗      ██╔════╝██╔═══██╗██╔══██╗██╔════╝
███████║ ╚████╔╝ ██████╔╝██████╔╝█████╗██║     ██║   ██║██████╔╝█████╗  
██╔══██║  ╚██╔╝  ██╔═══╝ ██╔══██╗╚════╝██║     ██║   ██║██╔══██╗██╔══╝  
██║  ██║   ██║   ██║     ██║  ██║      ╚██████╗╚██████╔╝██║  ██║███████╗
╚═╝  ╚═╝   ╚═╝   ╚═╝     ╚═╝  ╚═╝       ╚═════╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝

            HYPR-CORE // Vault33 Controller Node
EOF

echo "[+] Installed versions:"
neofetch --version
git --version
rsync --version | head -n1

echo "[✔] HYPR-CORE setup complete."
