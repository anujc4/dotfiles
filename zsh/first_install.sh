RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'

if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ]; then
  printf "${GREEN}Installing zsh-autosuggestions\n${NC}"
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi

if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-completions" ]; then
  printf "${GREEN}Installing zsh-completions\n${NC}"
  git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
fi

if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" ]; then
  printf "${GREEN}Installing zsh-syntax-highlighting\n${NC}"
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi

if [ ! -d "$HOME/.oh-my-zsh/custom/themes/powerlevel9k" ]; then
  printf "${GREEN}Installing powerlevel9k theme\n${NC}"
  git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
fi

if [ ! -d "$HOME/.oh-my-zsh/custom/zsh-interactive-cd" ]; then
  printf "${GREEN}Installing Interactive ZSH\n${NC}"
  git clone https://github.com/changyuheng/zsh-interactive-cd.git ~/.oh-my-zsh/custom/zsh-interactive-cd
fi

cd zsh # Go to the zsh folder

if [ ! -f secretsrc ]; then
  printf "${GREEN}Creating a secretsrc file. You should only put SENSITIVE aliases here. DO NOT PUT any credentials in the other files.\n${NC}"
  touch secretsrc
fi

cd .. # Go back to the root folder
