#!/bin/bash

source "$HOME/.config/common_wm/colors.sh"

caffeinate_item=(
  icon=􀇀
  icon.font="SF Pro:Regular:14.0"
  icon.color=$RED
  icon.padding_left=2
  icon.padding_right=2
  label.drawing=off
  script="$PLUGIN_DIR/caffeinate.sh"
  click_script="sketchybar --trigger caffeinate_toggle"
  update_freq=5
)

sketchybar --add event caffeinate_toggle                       \
                                                               \
           --add item caffeinate right                         \
           --set caffeinate "${caffeinate_item[@]}"            \
           --subscribe caffeinate caffeinate_toggle
