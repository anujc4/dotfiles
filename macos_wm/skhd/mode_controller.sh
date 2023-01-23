#!/usr/bin/env bash
# shellcheck disable=all

source "$HOME/.config/common_wm/colors.sh"

case "$1" in
default)
  sketchybar  --bar           color=$BAR_COLOR                         \
              --set /space.*/ label.background.color=$BACKGROUND_2     \
              --set /space.*/ icon.color=$WHITE                        \
              --set separator icon.color=$ORANGE                       \
              --trigger mode_changed                                   \
              --set mode_indicator label=""                            \
              --set mode_indicator drawing=off
  ;;
stack)
  sketchybar  --bar           color=$AQUA_STRONG                       \
              --set /space.*/ label.background.color=$AQUA             \
              --set /space.*/ icon.color=$BLACK                        \
              --set separator icon.color=$BLACK                        \
              --set mode_indicator drawing=on                          \
              --set mode_indicator label="[STACK]"
  ;;
display)
  sketchybar  --bar           color=$PURPLE_STRONG                     \
              --set /space.*/ label.background.color=$PURPLE           \
              --set /space.*/ icon.color=$BLACK                        \
              --set separator icon.color=$BLACK                        \
              --set mode_indicator drawing=on                          \
              --set mode_indicator label="[DISPLAY]"
  ;;
window)
  sketchybar  --bar           color=$YELLOW_STRONG                     \
              --set /space.*/ label.background.color=$YELLOW           \
              --set /space.*/ icon.color=$BLACK                        \
              --set separator icon.color=$BLACK                        \
              --set mode_indicator drawing=on                          \
              --set mode_indicator label="[WINDOW]"
  ;;
resize)
  sketchybar  --bar           color=$GREEN_STRONG                      \
              --set /space.*/ label.background.color=$GREEN            \
              --set /space.*/ icon.color=$BLACK                        \
              --set separator icon.color=$BLACK                        \
              --set mode_indicator drawing=on                          \
              --set mode_indicator label="[RESIZE]"
  ;;
inst)
  sketchybar  --bar           color=$BLUE_STRONG                       \
              --set /space.*/ label.background.color=$BLUE             \
              --set /space.*/ icon.color=$BLACK                        \
              --set separator icon.color=$BLACK                        \
              --set mode_indicator drawing=on                          \
              --set mode_indicator label="[INSERT]"
  ;;
esac
