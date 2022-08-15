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

ln -sf "$DOT_SOURCE/macos_wm/common" "$HOME/.config/common_wm"
ln -sf "$DOT_SOURCE/macos_wm/sketchybar" "$HOME/.config"
ln -sf "$DOT_SOURCE/macos_wm/yabai" "$HOME/.config"
ln -sf "$DOT_SOURCE/macos_wm/skhd" "$HOME/.config"

echo "done"
