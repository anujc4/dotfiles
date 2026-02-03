#!/bin/bash

source "$HOME/.config/common_wm/colors.sh"

POPUP_SCRIPT="sketchybar --set network.anchor popup.drawing=toggle"

network_anchor=(
  icon=􀤆
  icon.font="SF Pro:Regular:18.0"
  icon.color=$WHITE
  icon.padding_left=2
  icon.padding_right=2
  label.drawing=off
  label.padding_left=5
  label.padding_right=5
  click_script="$POPUP_SCRIPT"
  popup.align=right
  popup.height=35
  script="$PLUGIN_DIR/network.sh"
)

network_internal=(
  icon=􀇕
  icon.font="SF Pro:Regular:14.0"
  icon.color=$BLUE
  icon.padding_left=2
  icon.padding_right=2
  label="Internal: ..."
  label.font="SF Pro:Regular:14.0"
  label.padding_left=5
  label.padding_right=5
  click_script="ipconfig getifaddr en0 2>/dev/null || ipconfig getifaddr en1 | pbcopy; sketchybar --set network.anchor popup.drawing=off"
)

network_external=(
  icon=􀙇
  icon.font="SF Pro:Regular:14.0"
  icon.color=$GREEN
  icon.padding_left=2
  icon.padding_right=2
  label="External: ..."
  label.font="SF Pro:Regular:14.0"
  label.padding_left=5
  label.padding_right=5
  click_script="curl -s https://api.ipify.org | pbcopy; sketchybar --set network.anchor popup.drawing=off"
)

sketchybar --add item network.anchor right                          \
           --set network.anchor "${network_anchor[@]}"              \
           --subscribe network.anchor mouse.exited mouse.exited.global \
                                                                    \
           --add item network.internal popup.network.anchor         \
           --set network.internal "${network_internal[@]}"          \
                       script="$PLUGIN_DIR/network.sh"              \
           --subscribe network.internal mouse.exited                \
                                                                    \
           --add item network.external popup.network.anchor         \
           --set network.external "${network_external[@]}"          \
                       script="$PLUGIN_DIR/network.sh"              \
           --subscribe network.external mouse.exited
