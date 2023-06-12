#!/usr/bin/env bash

whitelisted_applications='(Preview|Code|RubyMine|Finder|Forklift)'

current_window=$(yabai -m query --windows --window "$YABAI_WINDOW_ID")
current_window_name=$(echo "$current_window" | jq .app)
current_window_id=$(echo "$current_window" | jq .id)

# look for other windows in the same space
other_windows=$(yabai -m query --windows --space)

# Iterate over all other apps in the same space to see if there's any other app
# already open in the space
echo "$other_windows" | jq -c '.[]' | while read -r i; do
    window_name=$(echo "$i" | jq .app)
    window_id=$(echo "$i" | jq .id)

    if [[ $window_id = "$current_window_id" ]]; then
      continue
    fi

    if [[ $current_window_name =~ $whitelisted_applications ]] && [[ $current_window_name = "$window_name" ]]; then
      yabai -m window "$window_id" --stack "$current_window_id"
      break
    fi
done
