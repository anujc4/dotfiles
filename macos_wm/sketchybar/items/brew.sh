#!/usr/bin/env bash

# Trigger the brew_udpate event when brew update or upgrade is run from cmdline

sketchybar --add event brew_update                 \
           --add item brew right                   \
           --set brew script="$PLUGIN_DIR/brew.sh" \
                      icon=􀐛                       \
                      label=?                      \
                      padding_right=10             \
          --subscribe brew brew_update
