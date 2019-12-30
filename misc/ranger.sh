#!/usr/bin/env bash

case $(uname) in
Darwin)
  # For MacOS
  brew install ranger
  ;;
Linux)
  # For *nix systems
  nix-env -i ranger
  ;;
esac

ln -sf `echo $DOT_SOURCE`/misc/rc.conf `echo $HOME`/.config/ranger/rc.conf

git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons
cd ~/.config/ranger/plugins/ranger_devicons && make install
