#!/usr/bin/env sh
# shellcheck disable=all

source "$HOME/.config/common_wm/colors.sh"

SPACE_ICONS=("1" "2" "3" "4" "5" "6" "7" "8" "9" "10")

for i in "${!SPACE_ICONS[@]}"
do
  sid=$(($i+1))
  sketchybar --add space space.$sid left                                 \
             --set space.$sid associated_space=$sid                      \
                              icon=${SPACE_ICONS[i]}                     \
                              icon.padding_left=8                        \
                              icon.padding_right=8                       \
                              background.padding_left=5                  \
                              background.padding_right=5                 \
                              background.color=$ORANGE                   \
                              background.corner_radius=5                 \
                              background.height=22                       \
                              background.drawing=off                     \
                              label.drawing=off                          \
                              script="$PLUGIN_DIR/space.sh"              \
                              click_script="$PLUGIN_DIR/switch_space.sh $sid"
done

sketchybar   --add item               separator left                          \
             --set separator          icon=                                  \
                                      icon.font="Hack Nerd Font:Regular:16.0" \
                                      background.padding_left=26              \
                                      background.padding_right=15             \
                                      label.drawing=off                       \
                                      icon.color=$ORANGE
