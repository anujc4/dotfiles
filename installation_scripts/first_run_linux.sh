RED='\033[0;31m'
NC='\033[0m'
BLUE='\033[0;34m'
YELLOW='\033[0;33m'
GREEN='\033[0;32m'

is_app_installed() {
  type "$1" &>/dev/null
}

sudo apt install software-properties-common

if ! is_app_installed curl; then
sudo apt install curl
fi

if ! is_app_installed nix-env; then
  printf "${RED}Installing nix-env.\n${NC}"
  curl https://nixos.org/nix/install | sh
  . /home/`whoami`/.nix-profile/etc/profile.d/nix.sh
fi

# Install ZSH if it is not yet installed
if ! [ -d "$ZSH" ]; then
  printf "${RED}Missing dependency: ZSH. This script WILL EXIT if you decide to change default shell after oh-my-zsh installation. You will need to run it again.\n${NC}"
  nix-env -i zsh
  sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

printf "${GREEN}Creating symlink for zshconfig\n${NC}"
ln -sf $(pwd)/zsh/zshrc $(echo $HOME)/.zshrc
./zsh/setup.sh
source ~/.zshrc

./tmux/setup.sh
./regolith/setup.sh
./fusuma/setup.sh
./alacritty/setup.sh

printf "${BLUE}Installing missing developer dependencies..\n${NC}"
if ! [ -x "$(command -v rvm)" ]; then
  printf "${GREEN}Installing RVM(Ruby Version Manager)\n${NC}"
  curl -sSL https://get.rvm.io | zsh -s stable --ruby
fi

if ! [ -x "$(command -v nvm)" ]; then
  printf "${GREEN}Installing NVM(Node Version Manager)\n${NC}"
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | zsh #NVM
fi


# while true; do
#   printf "${BLUE}Do you want to install a ruby manager?\nPress 1 for rvm, 2 for rbenv and anything else for none\n${NC}"
#   read -p "Choice:" yn
#   case $yn in
#   [1]*)
#     printf "${GREEN}Installing RVM(Ruby Version Manager)\n${NC}"
#     curl -sSL https://get.rvm.io | zsh -s stable --ruby
#     break
#     ;;
#   [2]*)
#     printf "${GREEN}Installing RBENV\n${NC}"
#     curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-installer | zsh
#     break
#     ;;
#   *)
#     break
#     ;;
#   esac
# done

printf "\n${YELLOW}All done. Enjoy :)\n${NC}"
