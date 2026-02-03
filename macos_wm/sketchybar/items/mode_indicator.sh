#!/usr/bin/env bash
# shellcheck disable=all

source "$HOME/.config/common_wm/colors.sh"
source "$HOME/.config/common_wm/icons.sh"

sketchybar   --add item               mode_indicator right              \
             --set mode_indicator     drawing=off                       \
                                      label.color="$WHITE"              \
                                      label.font="$FONT:Bold:14.0"      \
                                      label.padding_left=2              \
                                      label.padding_right=2             \
                                      padding_left=0                    \
                                      padding_right=0
