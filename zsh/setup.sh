#!/usr/bin/env bash

NC='\033[0m'
GREEN='\033[0;32m'

printf "${GREEN}Installing necessary oh-my-zsh plugins if not already installed.\n${NC}"
printf "${GREEN}This may take some time.\n${NC}"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions &>/dev/null
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions &>/dev/null
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting &>/dev/null
git clone https://github.com/changyuheng/zsh-interactive-cd.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/zsh-interactive-cd &>/dev/null

cd zsh # Go to the zsh folder
if [ ! -f secretsrc ]; then
  printf "${GREEN}Creating a secretsrc file. You should only put SENSITIVE aliases here. DO NOT PUT any credentials in the other files.\n${NC}"
  touch secretsrc
fi
cd .. # Go back to the root folder
