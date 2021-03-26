#!/usr/bin/env bash

if ! command -v brew &> /dev/null
then
    echo "missing brew. installing it now."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if ! command -v yabai &> /dev/null
then
    echo "missing yabai. installing it now."
    brew install yabai
fi

if ! command -v skhd &> /dev/null
then
    echo "missing skhd. installing it now."
    brew install skhd
fi

if [[ -z "${DOT_SOURCE}" ]]; then
  echo "DOT_SOURCE variable is not available. Have you set up zsh?"
  exit 1
fi

# create directory if not exists
mkdir -p "$HOME/.config/yabai"

# symlink yabai files
ln -s "$DOT_SOURCE/yabai/yabairc" "$HOME/.config/yabai/yabairc"
ln -s "$DOT_SOURCE/yabai/jetbrains.sh" "$HOME/.config/yabai/jetbrains.sh"
ln -s "$DOT_SOURCE/yabai/rearrange.sh" "$HOME/.config/yabai/rearrange.sh"

# create directory if not exists
mkdir -p "$HOME/.config/skhd"

# symlink skhd files
ln -s "$DOT_SOURCE/yabai/skhdrc" "$HOME/.config/skhd/skhdrc"
ln -s "$DOT_SOURCE/yabai/mode_controller.sh" "$HOME/.config/skhd/mode_controller.sh"

echo "done"
