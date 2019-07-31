RED='\033[0;31m'
NC='\033[0m'
BLUE='\033[0;34m'
YELLOW='\033[0;33m'
GREEN='\033[0;32m'

is_app_installed() {
  type "$1" &>/dev/null
}

# TODO Use this format
# if ! is_app_installed tmux; then
# fi

# Install ZSH if it is not yet installed
if ! [ -d "$ZSH" ]; then
  printf "${GREEN}Creating symlink for zshconfig\n${NC}"
  ln -sf $(pwd)/zsh/zshrc $(echo $HOME)/.zshrc
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
  ln -sf $(pwd)/tmux/tmux.conf $(echo $HOME)/.tmux.conf
  printf "${RED}Missing dependency: Tmux\n${NC}"
  printf "${GREEN}Installing tmux\n${NC}"
  brew install tmux
  printf "${GREEN}Installing tmux plugin manager\n${NC}"
  if [ ! -e "$HOME/.tmux/plugins/tpm" ]; then
    printf "${YELLOW}WARNING: Cannot found TPM (Tmux Plugin Manager) at default location: \$HOME/.tmux/plugins/tpm.\n${NC}"
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    # Install TPM plugins.
    # TPM requires running tmux server, as soon as `tmux start-server` does not work
    # create dump __noop session in detached mode, and kill it when plugins are installed
    printf "${GREEN}Installing TPM plugins\n${NC}"
    tmux new -d -s __noop >/dev/null 2>&1 || true
    tmux set-environment -g TMUX_PLUGIN_MANAGER_PATH "~/.tmux/plugins"
    "$HOME"/.tmux/plugins/tpm/bin/install_plugins || true
    tmux kill-session -t __noop >/dev/null 2>&1 || true
  fi
fi

printf "${GREEN}Executing Brewfile\n${NC}"
    brew bundle
    $(brew --prefix)/opt/fzf/install
    brew cleanup --force

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
