#!/usr/bin/env bash

NC='\033[0m'
GREEN='\033[0;32m'

printf "${GREEN}Installing Hack Nerd Font.\n${NC}"

case $(uname) in
  Darwin)
    brew tap homebrew/cask-fonts
    brew cask install font-hack-nerd-font
  ;;
  Linux)
    git clone https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip
    unzip Hack.zip -d ~/.fonts
    fc-cache -fv
    rm -rf Hack.zip
  ;;
esac

printf "${GREEN}Done!!\n${NC}"