#!/usr/bin/env bash
# shellcheck disable=all

source "$HOME/.config/common_wm/colors.sh"

case "$1" in
default)
  sketchybar  --bar           color=$BAR_COLOR            \
              --set /space.*/ icon.color=$WHITE           \
              --set separator icon.color=$ORANGE          \
              --trigger mode_changed                      \
              --set mode_indicator label=""               \
              --set mode_indicator drawing=off
  ;;
stack)
  sketchybar  --bar           color=$RED                  \
              --set /space.*/ icon.color=$BLACK           \
              --set separator icon.color=$BLACK           \
              --set mode_indicator drawing=on             \
              --set mode_indicator label="[STACK]"
  ;;
display)
  sketchybar  --bar           color=$MAGENTA              \
              --set /space.*/ icon.color=$BLACK           \
              --set separator icon.color=$BLACK           \
              --set mode_indicator drawing=on             \
              --set mode_indicator label="[DISPLAY]"
  ;;
window)
  sketchybar  --bar           color=$YELLOW               \
              --set /space.*/ icon.color=$BLACK           \
              --set separator icon.color=$BLACK           \
              --set mode_indicator drawing=on             \
              --set mode_indicator label="[WINDOW]"
  ;;
resize)
  sketchybar  --bar           color=$GREEN                \
              --set /space.*/ icon.color=$BLACK           \
              --set separator icon.color=$BLACK           \
              --set mode_indicator drawing=on             \
              --set mode_indicator label="[RESIZE]"
  ;;
inst)
  sketchybar  --bar           color=$BLUE                 \
              --set /space.*/ icon.color=$BLACK           \
              --set separator icon.color=$BLACK           \
              --set mode_indicator drawing=on             \
              --set mode_indicator label="[INSERT]"
  ;;
esac
