#!/usr/bin/env bash

show_ip_address() {
  tmux set-option -g @online_icon "󰤨"
  tmux set-option -g @offline_icon "󰤭"
  tmux set-option -g status-interval 5

  local index icon color text module
  index=$1

  # https://www.nerdfonts.com/cheat-sheet
  icon="$(get_tmux_option "@catppuccin_ip_address_icon" "#{online_status}")"
  # shellcheck disable=SC2154
  color="$(get_tmux_option "@catppuccin_ip_address_color" "$thm_green")"

  # Alternatively, use this to display the IP address of the current network
  # text="$(get_tmux_option "@catppuccin_ip_address_text" "#{ip_address}")"
  text="$(get_tmux_option "@catppuccin_ip_address_text" "#($DOT_SOURCE/roles/tmux/files/modules/network_speed.sh)")"

  module=$(build_status_module "$index" "$icon" "$color" "$text")

  echo "$module"
}
