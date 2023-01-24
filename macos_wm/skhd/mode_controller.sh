#!/usr/bin/env bash
# shellcheck disable=all

source "$HOME/.config/common_wm/colors.sh"

case "$1" in
default)
  sketchybar  --bar           color=$BAR_COLOR                         \
              --set /space.*/ label.background.color=$BACKGROUND_2     \
              --set /space.*/ icon.color=$WHITE                        \
              --set /space.*/ label.color=$WHITE                       \
              --set separator icon.color=$ORANGE                       \
              --trigger mode_changed                                   \
              --set mode_indicator label=""                            \
              --set system.yabai label.color=$WHITE                    \
              --set front_app label.color=$WHITE                       \
              --set brew icon.color=$WHITE                             \
              --set brew label.color=$WHITE                            \
              --set mode_indicator drawing=off
  ;;
stack)
  sketchybar  --bar           color=$AQUA_STRONG                       \
              --set /space.*/ label.background.color=$AQUA             \
              --set /space.*/ icon.color=$BLACK                        \
              --set /space.*/ label.color=$BLACK                       \
              --set separator icon.color=$BLACK                        \
              --set mode_indicator drawing=on                          \
              --set system.yabai label.color=$BLACK                    \
              --set front_app label.color=$BLACK                       \
              --set brew icon.color=$BLACK                             \
              --set brew label.color=$BLACK                            \
              --set mode_indicator label="[STACK]"
  ;;
display)
  sketchybar  --bar           color=$PURPLE_STRONG                     \
              --set /space.*/ label.background.color=$PURPLE           \
              --set /space.*/ icon.color=$BLACK                        \
              --set /space.*/ label.color=$BLACK                       \
              --set separator icon.color=$BLACK                        \
              --set mode_indicator drawing=on                          \
              --set system.yabai label.color=$BLACK                    \
              --set front_app label.color=$BLACK                       \
              --set brew icon.color=$BLACK                             \
              --set brew label.color=$BLACK                            \
              --set mode_indicator label="[DISPLAY]"
  ;;
window)
  sketchybar  --bar           color=$YELLOW_STRONG                     \
              --set /space.*/ label.background.color=$YELLOW           \
              --set /space.*/ icon.color=$BLACK                        \
              --set /space.*/ label.color=$BLACK                       \
              --set separator icon.color=$BLACK                        \
              --set mode_indicator drawing=on                          \
              --set system.yabai label.color=$BLACK                    \
              --set front_app label.color=$BLACK                       \
              --set brew icon.color=$BLACK                             \
              --set brew label.color=$BLACK                            \
              --set mode_indicator label="[WINDOW]"
  ;;
resize)
  sketchybar  --bar           color=$GREEN_STRONG                      \
              --set /space.*/ label.background.color=$GREEN            \
              --set /space.*/ icon.color=$BLACK                        \
              --set /space.*/ label.color=$BLACK                       \
              --set separator icon.color=$BLACK                        \
              --set mode_indicator drawing=on                          \
              --set system.yabai label.color=$BLACK                    \
              --set front_app label.color=$BLACK                       \
              --set brew icon.color=$BLACK                             \
              --set brew label.color=$BLACK                            \
              --set mode_indicator label="[RESIZE]"
  ;;
inst)
  sketchybar  --bar           color=$BLUE_STRONG                       \
              --set /space.*/ label.background.color=$BLUE             \
              --set /space.*/ icon.color=$BLACK                        \
              --set /space.*/ label.color=$BLACK                       \
              --set separator icon.color=$BLACK                        \
              --set mode_indicator drawing=on                          \
              --set system.yabai label.color=$BLACK                    \
              --set front_app label.color=$BLACK                       \
              --set brew icon.color=$BLACK                             \
              --set brew label.color=$BLACK                            \
              --set mode_indicator label="[INSERT]"
  ;;
reload)
  sketchybar  --bar           color=$RED_STRONG                        \
              --set /space.*/ label.background.color=$RED              \
              --set /space.*/ icon.color=$BLACK                        \
              --set system.yabai label.color=$BLACK                    \
              --set separator icon.color=$BLACK                        \
              --set front_app label.color=$BLACK                       \
              --set mode_indicator drawing=on                          \
              --set brew icon.color=$BLACK                             \
              --set brew label.color=$BLACK                            \
              --set mode_indicator label="[RELOAD] 1:YABAI, 2:SKHD, 3:SKETCHYBAR, 0:ALL"
  ;;
esac
