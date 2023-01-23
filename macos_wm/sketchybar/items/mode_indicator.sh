#!/usr/bin/env bash
# shellcheck disable=all

source "$HOME/.config/common_wm/icons.sh"

sketchybar   --add item               mode_indicator center             \
             --set mode_indicator     drawing=off                       \
                                      label.color="$BLACK"              \
                                      label.font="$FONT:Bold:14.0"      \
                                      background.padding_left=15        \
                                      background.padding_right=15
