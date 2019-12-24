NC='\033[0m'
YELLOW='\033[0;33m'
GREEN='\033[0;32m'

printf "${GREEN}Installing regolith linux if not already installed.\n${NC}"
sudo add-apt-repository -y ppa:kgilmer/regolith-stable
sudo apt install regolith-desktop

printf "${YELLOW}If you are on Ubuntu 19.10, check out https://github.com/regolith-linux/regolith-desktop/wiki/HowTo:-Upgrade-to-Ubuntu-19.10-(Eoan-Ermine).\n${NC}"

mkdir -p `echo $HOME`/.config/regolith/i3
mkdir -p `echo $HOME`/.config/compton

# Modify these to point to correct directory
ln -sf $(echo $DOT_SOURCE)/regolith/Xresources/.Xresources-regolith ~/.Xresources-regolith
ln -sf $(echo $DOT_SOURCE)/regolith/Xresources/Xresources.d ~/.Xresources.d
ln -sf $(echo $DOT_SOURCE)/regolith/i3/config /home/anuj/.config/regolith/i3/config
ln -sf $(echo $DOT_SOURCE)/regolith/compton /home/anuj/.config/compton