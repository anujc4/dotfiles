RED='\033[0;31m'
NC='\033[0m'
BLUE='\033[0;34m'
YELLOW='\033[0;33m'
GREEN='\033[0;32m'

if [ -z "$FIRST_RUN" ]; then
  printf "${BLUE}Script is executing for the first time. Setting up terminal dependencies.\n${NC}"

  printf "${GREEN}Installing zsh-autosuggestions\n${NC}"
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

  printf "${GREEN}Installing zsh-completions\n${NC}"
  git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions

  printf "${GREEN}Installing zsh-syntax-highlighting\n${NC}"
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

  printf "${GREEN}Installing powerlevel9k theme\n${NC}"
  git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

  if [ "$isMacOS" = true ]; then
    printf "${BLUE}System running MacOS. Attempting to install Nerd Fonts. You need to change terminal font manually.\n${NC}"
    brew tap homebrew/cask-fonts
    brew cask install font-hack-nerd-font
  fi

fi
