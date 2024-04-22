#!/usr/bin/env bash

show_mode_indicator() {
  tmux set-option -g @mode_indicator_prefix_mode_style 'bg=#fb4934,fg=#282828'
  tmux set-option -g @mode_indicator_copy_mode_style 'bg=#fabd2f,fg=#282828'
  tmux set-option -g @mode_indicator_sync_mode_style 'bg=#83a598,fg=#282828'
  tmux set-option -g @mode_indicator_empty_mode_style 'bg=#b8bb26,fg=#282828'

  local index icon color text module
  index=$1

  # https://www.nerdfonts.com/cheat-sheet
  icon="$(get_tmux_option "@catppuccin_mode_indicator_icon" "#{tmux_mode_indicator}")"
  # shellcheck disable=SC2154
  color="$(get_tmux_option "@catppuccin_mode_indicator_color" "#{?client_prefix,$thm_red,$thm_green}")"

  # Alternatively, use this to display the IP address of the current network
  # text="$(get_tmux_option "@catppuccin_mode_indicator_text" "#{mode_indicator}")"
  text="$(get_tmux_option "@catppuccin_mode_indicator_text" "#(tmux_mode_indicator)")"

  module=$(build_status_module "$index" "$icon" "$color" "$text")

  echo "$module"
}
