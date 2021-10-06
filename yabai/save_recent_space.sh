#!/bin/sh

# Get the index of the previous space
previous_window_index=$(yabai -m query --spaces | jq -r ".[] | select(.id == $YABAI_RECENT_SPACE_ID) | .index")

# Store the index in a temporary file
echo "$previous_window_index" > ~/.config/yabai/recent_space
