#!/usr/bin/env bash

RED='\033[0;31m'
NC='\033[0m'
YELLOW='\033[0;33m'
GREEN='\033[0;32m'

# Make sure that nvim is installed in the system.
# If not installed, attempt to install it via nix-env
if ! [ -x "$(command -v nvim)" ]; then
  if ! [ -x "$(command -v nix-env)" ]; then
    printf "${RED}The command requires nix-env to run. Please install nix-env first.\n${NC}"
    exit 1
  fi
  # Install neovim and replace python3 with python2 for the python 2 packages
  nix-env -iA nixpkgs.neovim
  nix-env -iA nixpkgs.python3Packages.pynvim
  mkdir -p `echo $HOME`/.config/nvim
fi

printf "${GREEN}Installing vim-plug.\n${NC}"
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

printf "${GREEN}Creating symlinks.\n${NC}"
# Add symlink for the main vimrc file
ln -sf `echo $DOT_SOURCE`/vim/init.vim `echo $HOME`/.config/nvim/init.vim

# Make sure to symlink the newly created files here as well as
# sourcing it in the init.vim file
ln -sf `echo $DOT_SOURCE`/vim/coc.vim `echo $HOME`/.config/nvim/coc.vim
ln -sf `echo $DOT_SOURCE`/vim/general.vim `echo $HOME`/.config/nvim/general.vim
ln -sf `echo $DOT_SOURCE`/vim/go.vim `echo $HOME`/.config/nvim/go.vim
ln -sf `echo $DOT_SOURCE`/vim/plugin_config.vim `echo $HOME`/.config/nvim/plugin_config.vim

# Symlink coc-settings.json
ln -sf `echo $DOT_SOURCE`/vim/coc-settings.json `echo $HOME`/.config/nvim/coc-settings.json

# Make sure to call this after the files have been symlinked
printf "${GREEN}Installing plugins.\n${NC}"
nvim +PlugInstall +qall

# End script
printf "${GREEN}Process complete. Neovim setup is now complete.\n${NC}"