RED='\033[0;31m'
NC='\033[0m'
BLUE='\033[0;34m'
YELLOW='\033[0;33m'
GREEN='\033[0;32m'

# Install ZSH if it is not yet installed
if ! [ -d "$ZSH" ]; then
  printf "${GREEN}Creating symlink for zshconfig\n${NC}"
  ln -s $(pwd)/zsh/zshrc $(echo $HOME)/.zshrc
  printf "${RED}Missing dependency: ZSH. This script WILL EXIT if you decide to change default shell after oh-my-zsh installation. You will need to run it again.\n${NC}"
  sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

# Check if brew is installed. Before installing newer dependencies
if ! [ -x "$(command -v brew)" ]; then
  printf "${RED}Missing dependency: Homebrew\n${NC}"
  printf "${GREEN}Installing Homebrew\n${NC}"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Check if tmux is installed
if ! [ -x "$(command -v tmux)" ]; then
  printf "${GREEN}Creating symlink for .tmux.conf\n${NC}"
  ln -s $(pwd)/tmux.conf $(echo $HOME)/.tmux.conf
  printf "${RED}Missing dependency: Tmux\n${NC}"
  printf "${GREEN}Installing tmux\n${NC}"
  brew install tmux
  printf "${GREEN}Installing tmux plugin manager\n${NC}"
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  printf "${GREEN}TPM is installed. Please launch tmux in a separate tab and run Prefix - I\n${NC}"
fi

while true; do
  read -p "Do you wish to run the Brewfile? This will install most of the required dependencies required by your system." yn
  case $yn in
  [Yy]*)
    printf "${GREEN}Executing Brewfile\n${NC}"
    brew bundle
    $(brew --prefix)/opt/fzf/install
    brew cleanup --force
    break
    ;;
  [Nn]*) break ;;
  *) echo "Please answer yes or no." ;;
  esac
done

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null && pwd)"

while true; do
  printf "${BLUE}Do you want to install a tiling manager? Press 1 for Yabai, 2 for Amethyst and anything else for none\n${NC}"
  read -p "Choice:" yn
  case $yn in
  [1]*)
    brew tap koekeishiya/formulae
    brew install koekeishiya/formulae/skhd
    brew install yabai
    sudo yabai --install-sa
    printf "${GREEN}Renaming any previouisly created configurations\n${NC}"
    mv $(echo $HOME)/.yabairc $(echo $HOME)/.yabairc_backup
    mv $(echo $HOME)/.skhdrc $(echo $HOME)/.skhdrc_backup

    printf "${RED}You need to disable System Integrity Protection on your system. Please check yabai/README.md for instructions"
    printf "${GREEN}Creating symlink file associations\n${NC}"
    ln -s $(echo $DIR)/yabai/yabairc $(echo $HOME)/.yabairc
    ln -s $(echo $DIR)/yabai/skhdrc $(echo $HOME)/.skhdrc
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

printf "${BLUE}Installing missing developer dependencies..\n${NC}"

if ! [ -x "$(command -v nvm)" ]; then
  printf "${GREEN}Installing NVM(Node Version Manager)\n${NC}"
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash #NVM
fi

if ! [ -x "$(command -v rvm)" ]; then
  printf "${GREEN}Installing RVM(Ruby Version Manager)\n${NC}"
  curl -sSL https://get.rvm.io | bash -s stable --ruby
fi

printf "\n${YELLOW}All done. Enjoy :)\n${NC}"
