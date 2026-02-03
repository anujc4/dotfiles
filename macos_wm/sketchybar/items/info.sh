#!/bin/bash

source "$HOME/.config/common_wm/colors.sh"

POPUP_SCRIPT="sketchybar --set info.anchor popup.drawing=toggle"

info_anchor=(
  icon=􀅴
  icon.font="SF Pro:Regular:14.0"
  icon.color=$WHITE
  icon.padding_left=0
  icon.padding_right=2
  padding_right=10
  label.drawing=off
  click_script="$POPUP_SCRIPT"
  popup.align=right
  popup.height=35
  script="$PLUGIN_DIR/info.sh"
)

info_restart_yabai=(
  icon=􀅈
  icon.font="SF Pro:Regular:14.0"
  icon.color=$YELLOW
  label="Restart yabai"
  label.font="SF Pro:Regular:14.0"
  click_script="yabai --restart-service; sketchybar --set info.anchor popup.drawing=off"
)

info_restart_all=(
  icon=􀊄
  icon.font="SF Pro:Regular:14.0"
  icon.color=$RED
  label="Restart wm"
  label.font="SF Pro:Regular:14.0"
  click_script="yabai --restart-service; skhd --restart-service; sketchybar --reload"
)

info_caffeinate=(
  icon=􀀹
  icon.font="SF Pro:Regular:14.0"
  icon.color=$GREEN
  label="Caffeinate 4h"
  label.font="SF Pro:Regular:14.0"
  script="$PLUGIN_DIR/info.sh"
  click_script="sketchybar --trigger caffeinate_toggle"
  update_freq=1
  updates=when_shown
)

sketchybar --add event caffeinate_toggle                         \
                                                                 \
           --add item info.anchor right                          \
           --set info.anchor "${info_anchor[@]}"                 \
           --subscribe info.anchor mouse.exited.global           \
                                                                 \
           --add item info.restart_yabai popup.info.anchor       \
           --set info.restart_yabai "${info_restart_yabai[@]}"   \
                                                                 \
           --add item info.restart_all popup.info.anchor         \
           --set info.restart_all "${info_restart_all[@]}"       \
                                                                 \
           --add item info.caffeinate popup.info.anchor          \
           --set info.caffeinate "${info_caffeinate[@]}"         \
           --subscribe info.caffeinate caffeinate_toggle
