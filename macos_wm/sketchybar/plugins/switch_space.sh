#!/usr/bin/env bash

echo "$1"

if yabai --check-sa; then
  yabai -m space --focus "$1"
else
  "$HOME/.config/skhd/switch_space.sh" "$1"
fi
