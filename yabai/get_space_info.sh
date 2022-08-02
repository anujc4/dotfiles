#!/bin/sh

# returns true/false based on whether the currently focused window is zoomed out
is_zoom=$(yabai -m query --windows --window | jq '."has-fullscreen-zoom"')

if [ "$is_zoom" = "true" ]; then
    zoom="[Z] "
else
    zoom=""
fi

# returns "bsp" or "stack"
layout=$(yabai -m query --spaces --space | jq -r '."type"')

windows_count=$(yabai -m query --windows --space | jq length)
echo "${zoom}${layout} - windows: ${windows_count}"
