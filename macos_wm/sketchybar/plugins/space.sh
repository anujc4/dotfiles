#!/usr/bin/env bash

update() {
  WIDTH="dynamic"
  if [ "$SELECTED" = "true" ]; then
    WIDTH="0"
  fi

  sketchybar --animate tanh 20 --set "$NAME" label.width=$WIDTH icon.highlight="$SELECTED"
}

mouse_clicked() {
  if [ "$BUTTON" = "right" ]; then
    yabai -m space --destroy "$SID"
    sketchybar --trigger space_change
  else
    "$HOME/.config/skhd/switch_space.sh" "$SID" 2>/dev/null
  fi
}

case "$SENDER" in
  "mouse.clicked") mouse_clicked
  ;;
  *) update
  ;;
esac
