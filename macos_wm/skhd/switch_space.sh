#!/usr/bin/env bash

# Complete list of key codes
# https://eastmanreference.com/complete-list-of-applescript-key-codes

typeset -a space_hash

space_hash[0]=29
space_hash[1]=18
space_hash[2]=19
space_hash[3]=20
space_hash[4]=21
space_hash[5]=23
space_hash[6]=22
space_hash[7]=26
space_hash[8]=28
space_hash[9]=25

if [ "$1" -eq 10 ]; then
  space=0
  desktopkey=${space_hash[space]}
  osascript -e "tell application \"System Events\" to key code $desktopkey using control down"
elif [ "$1" -gt 10 ]; then
  space=$(($1 % 10))
  desktopkey=${space_hash[space]}
  osascript -e "tell application \"System Events\" to key code $desktopkey using {control down, option down}"
else
  space=$1
  desktopkey=${space_hash[space]}
  osascript -e "tell application \"System Events\" to key code $desktopkey using control down"
fi
