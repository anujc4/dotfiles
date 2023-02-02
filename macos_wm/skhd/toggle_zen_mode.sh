#!/usr/bin/env bash

external_bar=$(yabai -m config external_bar)
IFS=':' read -ra ADDR <<< "$external_bar"

if [ "${ADDR[0]}" = "all" ]; then
  echo "zen mode on"
  yabai -m window --toggle zoom-fullscreen
  sketchybar --trigger window_focus
  space=$(yabai -m query --windows --window | jq -r ".space")
  yabai -m config --space "$space" external_bar    main:0:0
  yabai -m space --toggle padding
  yabai -m space --toggle gap
  sketchybar --animate sin 30 --bar hidden=current
elif [ "${ADDR[0]}" = "main" ]; then
  echo "zen mode off"
  yabai -m window --toggle zoom-fullscreen
  sketchybar --trigger window_focus
  space=$(yabai -m query --windows --window | jq -r ".space")
  yabai -m config --space "$space" external_bar    all:0:30
  yabai -m space --toggle padding
  yabai -m space --toggle gap
  sketchybar --animate sin 30 --bar hidden=current
else
  # Unknown state. Don't do anything
  echo "unhandled state: ${ADDR[0]}"
fi
