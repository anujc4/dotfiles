#!/usr/bin/env bash

# This script is a hack to inject a gruvbox theme into the catppuccin/tmux plugin
# GRUVBOX EVERYTHING!!!

# Check if the directory /Users/$whoami/.tmux/plugins/tmux exists
if [ -d "/Users/$(whoami)/.tmux/plugins/tmux" ]; then
  echo "Injecting custom colorscheme file catppuccin-gruvbox.tmuxtheme"
  touch "/Users/$(whoami)/.tmux/plugins/tmux/catppuccin-gruvbox.tmuxtheme"
  cat <<EOF > "/Users/$(whoami)/.tmux/plugins/tmux/catppuccin-gruvbox.tmuxtheme"
thm_bg="#282828"
thm_fg="#ebdbb2"
thm_cyan="#83a598"
thm_black="#282828"
thm_gray="#3c3836"
thm_magenta="#d3869b"
thm_pink="#d3869b"
thm_red="#fb4934"
thm_green="#b8bb26"
thm_yellow="#fabd2f"
thm_blue="#83a598"
thm_orange="#fe8019"
thm_black4="#665c54"
EOF
  echo "Process completed"
else
  echo "The directory /Users/$(whoami)/.tmux/plugins/tmux does not exist"
  return 1
fi
