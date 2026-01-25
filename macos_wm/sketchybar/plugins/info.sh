#!/bin/bash

case "$SENDER" in
  "mouse.exited.global") sketchybar --set info.anchor popup.drawing=off ;;
esac
