#!/usr/bin/env bash

RED='\033[0;31m'
NC='\033[0m'

# Make sure that fusuma is installed in the system.
# If not installed, attempt to install it via nix-env
if ! [ -x "$(command -v fusuma)" ]; then
  if ! [ -x "$(command -v nix-env)" ]; then
    printf "${RED}The command requires nix-env to run. Please install nix-env first.\n${NC}"
    exit 1
  fi
  # Install neovim and replace python3 with python2 for the python 2 packages
  nix-env -i fusuma
fi

mkdir -p `echo $HOME`/.config/fusuma
ln -sf $(echo $DOT_SOURCE)/fusuma/config.yml `echo $HOME`/.config/fusuma/config.yml