#!/usr/bin/env bash

# This is a helper script to copy a set of key bindings based on whether
# the system is running with SIP enabled or disabled

echo "Attempting to load yabai scripting addition"

if csrutil status | grep -q "System Integrity Protection status: enabled"; then
  echo "SIP Enabled: Linking sip_enabled_skhdrc"
  ln -sf "$DOT_SOURCE/macos_wm/skhd/sip_enabled_skhdrc" "$HOME/.config/skhd/sip_skhdrc"
else
  echo "SIP Disabled: Linking sip_disabled_skhdrc"
  ln -sf "$DOT_SOURCE/macos_wm/skhd/sip_disabled_skhdrc" "$HOME/.config/skhd/sip_skhdrc"
fi
