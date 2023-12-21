#!/bin/bash

# Check if Neovim is already installed
if command -v nvim >/dev/null 2>&1; then
    echo "Neovim is already installed."
    exit 0
fi

# Check if /opt/bin is in PATH
if [[ ":$PATH:" != *":/opt/bin:"* ]]; then
    # Add /opt/bin to the PATH for current and future sessions
    export PATH=/opt/bin:$PATH
    echo 'export PATH=/opt/bin:$PATH' | sudo tee -a ~/.profile
fi

# Install Entware with sudo
sudo wget -O - http://bin.entware.net/x64-k3.2/installer/generic.sh | sudo sh

# Update packages and install Neovim with sudo
sudo opkg update
sudo opkg install neovim

# Final check for Neovim installation
if command -v nvim >/dev/null 2>&1; then
    echo "Neovim installed successfully."
else
    echo "Neovim installation failed."
fi
