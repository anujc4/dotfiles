#!/bin/bash

whitelisted_applications='(Preview|Code|RubyMine|Finder|Forklift)'

current_window=$(yabai -m query --windows --window "$YABAI_WINDOW_ID")
current_window_name=$(echo "$current_window" | jq .app)
current_window_id=$(echo "$current_window" | jq .id)

prev_window=$(yabai -m query --windows --window recent)
prev_window_name=$(echo "$prev_window" | jq .app)
prev_window_id=$(echo "$prev_window" | jq .id)

if [[ $current_window_name =~ $whitelisted_applications ]] && [[ $current_window_name = "$prev_window_name" ]]; then
  yabai -m window "$prev_window_id" --stack "$current_window_id"
fi
