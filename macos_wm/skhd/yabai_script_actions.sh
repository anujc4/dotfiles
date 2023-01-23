#!/usr/bin/env bash

function rotate_clockwise() {
  win=$(yabai -m query --windows --window last | jq '.id')

  while :; do
    yabai -m window "$win" --swap prev &>/dev/null
    if [[ $? -eq 1 ]]; then
      break
    fi
  done
}

function rotate_counter_clockwise() {
  win=$(yabai -m query --windows --window first | jq '.id')

  while :; do
    yabai -m window "$win" --swap next &>/dev/null
    if [[ $? -eq 1 ]]; then
      break
    fi
  done
}

if [ "$1" == "rotate_clockwise" ]; then
  rotate_clockwise
elif [ "$1" == "rotate_counter_clockwise" ]; then
  rotate_counter_clockwise
elif [ -z "$1" ]; then
  echo "Invoked with no action"
fi
