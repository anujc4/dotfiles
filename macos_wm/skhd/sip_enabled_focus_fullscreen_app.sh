#!/usr/bin/env bash

# This script provides a workaround for focusing spaces that are running windows
# in native-fullscreen mode. We can't directly focus on the space itself
# using `yabai -m space --focus n` because it will give an error
# "cannot focus space due to an error with the scripting-addition."

# However, yabai can still focus on the windows within the space. So, this script
# will focus on an arbitrary space (integer argument) by finding the window ID
# running in that space and focusing on it.

# Usage: ./focus_fullscreen_space.sh <number>
# Example: ./focus_fullscreen_space.sh 1 (focuses on the 1st fullscreen space)

# Get the target fullscreen space number (1-based index)
target=$1

if [[ -z "$target" || ! "$target" =~ ^[0-9]+$ ]]; then
  echo "Error: Please provide a valid number as argument"
  return 1
fi

# Get all spaces information
spaces_json=$(yabai -m query --spaces)

# Find all fullscreen spaces and their window IDs
fullscreen_spaces=$(echo "$spaces_json" | jq -c '[.[] | select(.["is-native-fullscreen"] == true) | {index: .index, windows: .windows}]')

# Count how many fullscreen spaces we have
fullscreen_count=$(echo "$fullscreen_spaces" | jq 'length')

if [[ $fullscreen_count -eq 0 ]]; then
  echo "No fullscreen spaces found"
  return 1
fi

if [[ $target -gt $fullscreen_count ]]; then
  echo "Only $fullscreen_count fullscreen spaces available, cannot focus on space $target"
  return 1
fi

# Get the target fullscreen space (convert from 1-based to 0-based index)
target_space=$(echo "$fullscreen_spaces" | jq ".[$((target-1))]")

if [[ -z "$target_space" || "$target_space" == "null" ]]; then
  echo "Could not find fullscreen space $target"
  return 1
fi

# Get all window IDs from the target space
window_ids=$(echo "$target_space" | jq '.windows[]')

# Find all window IDs that appear in multiple spaces
common_window_ids=$(echo "$spaces_json" | jq -c '[.[] | select(.["is-native-fullscreen"] == true) | .windows[]] | group_by(.) | map(select(length > 1)) | flatten | unique')

# Get the first window ID that is unique to this space (not in common_window_ids)
unique_window_id=$(echo "$window_ids" | while read -r id; do
  if ! echo "$common_window_ids" | jq -e "contains([$id])" > /dev/null; then
    echo "$id"
    break
  fi
done)

# If no unique window found, just use the first window
if [[ -z "$unique_window_id" ]]; then
  unique_window_id=$(echo "$window_ids" | head -n 1)
fi

yabai -m window --focus "$unique_window_id"
