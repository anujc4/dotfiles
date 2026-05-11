#!/bin/bash

source "$HOME/.config/common_wm/colors.sh"

help_anchor=(
  icon=
  label.drawing=off
  icon.padding_left=0
  icon.padding_right=0
  padding_left=0
  padding_right=0
  background.drawing=off
  popup.align=right
  popup.height=28
  popup.y_offset=0
  popup.blur_radius=0
  popup.background.color.alpha=1.0
  popup.background.border_color.alpha=1.0
)

sketchybar --add item help_anchor right \
           --set help_anchor "${help_anchor[@]}"

# Pre-warm the parser cache so the first `?` press is instant.
# Uses an mtime stamp so it only re-parses when skhdrc changes.
"$HOME/.config/sketchybar/plugins/help/toggle_help.sh" prewarm >/dev/null 2>&1 || true
