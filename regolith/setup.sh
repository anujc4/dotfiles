#!/usr/bin/env bash

NC='\033[0m'
YELLOW='\033[0;33m'
GREEN='\033[0;32m'

printf "${GREEN}Installing regolith linux if not already installed.\n${NC}"
sudo add-apt-repository ppa:regolith-linux/release
sudo apt install regolith-desktop i3xrocks-net-traffic i3xrocks-cpu-usage i3xrocks-time i3xrocks-battery
sudo apt install regolith-look-ayu-dark

mkdir -p `echo $HOME`/.config/regolith/i3

# Modify these to point to correct directory
ln -sf `echo $DOT_SOURCE`/regolith/regolith/Xresources `echo $HOME`/.config/regolith/Xresources
ln -sf `echo $DOT_SOURCE`/regolith/i3/config `echo $HOME`/.config/regolith/i3/config

# Set theme for regolith
rm -f `echo $HOME`/.Xresources-regolith # Delete the file if it already exists
echo "#include \"/etc/regolith/styles/ayu-dark/root\"" >> `echo $HOME`/.Xresources-regolith
