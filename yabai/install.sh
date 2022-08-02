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

if ! command -v spacebar &> /dev/null
then
    echo "missing spacebar. installing it now."
    brew install cmacrae/formulae/spacebar
    brew services start spacebar
fi

if ! command -v jq &> /dev/null
then
    echo "missing jq. installing it now."
    brew install jq
fi

if [[ -z "${DOT_SOURCE}" ]]; then
  echo "DOT_SOURCE variable is not available. Have you set up zsh?"
  exit 1
fi

# create directory if not exists
mkdir -p "$HOME/.config/yabai"

# symlink yabai files
ln -sf "$DOT_SOURCE/yabai/yabairc" "$HOME/.config/yabai/yabairc"
ln -sf "$DOT_SOURCE/yabai/rearrange.sh" "$HOME/.config/yabai/rearrange.sh"
ln -sf "$DOT_SOURCE/yabai/save_recent_space.sh" "$HOME/.config/yabai/save_recent_space.sh"

# create directory if not exists
mkdir -p "$HOME/.config/skhd"

# symlink skhd files
ln -sf "$DOT_SOURCE/yabai/skhdrc" "$HOME/.config/skhd/skhdrc"
ln -sf "$DOT_SOURCE/yabai/mode_controller.sh" "$HOME/.config/skhd/mode_controller.sh"
ln -sf "$DOT_SOURCE/yabai/switch_space.sh" "$HOME/.config/skhd/switch_space.sh"

# create directory if not exists
mkdir -p "$HOME/.config/spacebar"

# symlink spacebar files
ln -sf "$DOT_SOURCE/yabai/spacebarrc" "$HOME/.config/spacebar/spacebarrc"
ln -sf "$DOT_SOURCE/yabai/get_space_info.sh" "$HOME/.config/spacebar/get_space_info.sh"

echo "done"
