#!/usr/bin/env bash

RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'

is_app_installed() {
  type "$1" &>/dev/null
}

if ! is_app_installed brew; then
  printf "${RED}Installing homebrew.\n${NC}"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

printf "${GREEN}Executing Brewfile\n${NC}"
brew bundle
$(brew --prefix)/opt/fzf/install
brew cleanup --force
