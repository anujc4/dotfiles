#!/usr/bin/env bash

RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'

# Check if alacritty is already installed
if ! [ -x "$(command -v nix-env)" ]; then
  printf "${RED}The command requires nix-env to run. Please install nix-env first.\n${NC}"
  exit 1
fi

# Install alacritty
nix-env -iA nixos.alacritty

# Create config directory if not already created
mkdir -p $(echo $HOME/.config/alacritty)

# Symlink the config file
case $(uname) in
Darwin)
  # Symlink MacOS Alacritty as config
  ln -sf `echo $DOT_SOURCE`/Alacritty/alacritty.yml `echo $HOME`/.config/alacritty/alacritty.yml
  ;;
Linux)
  # Symlink Linux Alacritty as config
  ln -sf `echo $DOT_SOURCE`/Alacritty/alacritty_linux.yml `echo $HOME`/.config/alacritty/alacritty.yml
  ;;
esac

# End script
printf "${GREEN}Process complete. Alacritty setup is now complete.\n${NC}"
