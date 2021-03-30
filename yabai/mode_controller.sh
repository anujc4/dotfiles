#!/usr/bin/env bash

# Colors taken from gruvbox theme
# https://github.com/morhetz/gruvbox

case "$1" in
default)
  spacebar -m config background_color   0xff282828
  spacebar -m config foreground_color   0xfffbf1c7
  ;;
active) # red
  spacebar -m config background_color 0xfffb4934
  spacebar -m config foreground_color 0xff282828
  ;;
display) # purple
  spacebar -m config background_color 0xffd3869b
  spacebar -m config foreground_color 0xff282828
  ;;
window) # yellow
  spacebar -m config background_color 0xfffabd2f
  spacebar -m config foreground_color 0xff282828
  ;;
resize) # green
  spacebar -m config background_color 0xffb8bb26
  spacebar -m config foreground_color 0xff282828
  ;;
launch) # aqua
  spacebar -m config background_color 0xff8ec07c
  spacebar -m config foreground_color 0xff282828
  ;;
# NOT YET USED
free_mode) # blue
  spacebar -m config background_color 0xff83a598
  spacebar -m config foreground_color 0xff282828
  ;;
esac
