RED='\033[0;31m'
NC='\033[0m'
BLUE='\033[0;34m'
YELLOW='\033[0;33m'
GREEN='\033[0;32m'

is_app_installed() {
  type "$1" &>/dev/null
}

if ! is_app_installed nix-env; then
  printf "${RED}Installing nix-env for package management.\n${NC}"
  curl https://nixos.org/nix/install | sh
fi

# Install ZSH if it is not yet installed
if ! [ -d "$ZSH" ]; then
  printf "${RED}Missing dependency: ZSH. This script WILL EXIT if you decide to change default shell after oh-my-zsh installation. You will need to run it again.\n${NC}"
  sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

printf "${GREEN}Creating symlink for zshconfig\n${NC}"
ln -sf $(pwd)/zsh/zshrc $(echo $HOME)/.zshrc
./zsh/setup.sh
source ~/.zshrc

./tmux/setup.sh
./alacritty/setup.sh
./homebrew/setup.sh

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null && pwd)"

while true; do
  printf "${BLUE}Do you want to install a tiling manager? Press 1 for Yabai, 2 for Amethyst and anything else for none\n${NC}"
  read -p "Choice:" yn
  case $yn in
  [1]*)
    brew tap koekeishiya/formulae
    brew install koekeishiya/formulae/skhd
    brew install yabai
    # sudo yabai --install-sa
    printf "${GREEN}Renaming any previouisly created configurations\n${NC}"
    mv $(echo $HOME)/.yabairc $(echo $HOME)/.yabairc_backup
    mv $(echo $HOME)/.skhdrc $(echo $HOME)/.skhdrc_backup

    printf "${RED}You need to disable System Integrity Protection on your system. Please check yabai/README.md for instructions"
    printf "${GREEN}Creating symlink file associations\n${NC}"
    ln -sf $(echo $DIR)/yabai/yabairc $(echo $HOME)/.yabairc
    ln -sf $(echo $DIR)/yabai/skhdrc $(echo $HOME)/.skhdrc
    break
    ;;
  [2]*)
    printf "${GREEN}Installing Amethyst\n${NC}"
    brew cask install amethyst
    break
    ;;
  *)
    break
    ;;
  esac
done

printf "\n${YELLOW}All done. Enjoy :)\n${NC}"
