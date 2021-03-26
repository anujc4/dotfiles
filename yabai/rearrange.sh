function display_added_actions() {
  # When iPad sidecar is connected, move spotify to the first space of the sidecar
  # Filters sidecar based on its resolution
  sidecar_display="$(yabai -m query --displays | jq -re ".[] | select((.frame.w == 1024.0000) and .frame.h == 768.0000) | .spaces[0]")"
  # Return if the new added display was not iPas sidecar
  if [ -z "${sidecar_display}" ]; then
    exit 0
  fi
  #
  spotify_id="$(yabai -m query --windows | jq -re ".[] | select(.app == \"Spotify\") | .id")"
  yabai -m window "${spotify_id}" --space "${sidecar_display}"
}

function display_removed_actions() {
  # Move Spotify back to space 5 when iPad sidecar is disconnected
  spotify_id="$(yabai -m query --windows | jq -re ".[] | select(.app == \"Spotify\") | .id")"
  yabai -m window "${spotify_id}" --space 5
}

function toggle_border() {
  type="$(yabai -m query --spaces --space | jq -re ".type")"
  if [ "${type}" == "bsp" ]; then
    # Turn borders on if the current space is in bsp layout
    yabai -m config window_border on
  else
    # Turn borders off if the current space is in stack layout
    yabai -m config window_border off
  fi
}

function sidecar() {
  read -d '' AppleScript <<EOF
tell application "System Preferences"
activate
reveal pane id "com.apple.preference.sidecar"
delay 1

tell application "System Events" to click first menu button of first window of application process "System Preferences" of application "System Events"
tell application "System Events" to click first menu item of first menu of first menu button of first window of application process "System Preferences" of application "System Events"

quit
end tell
EOF
  osascript -e "$AppleScript"
}

if [ "$1" == "add" ]; then
  display_added_actions
elif [ "$1" == "remove" ]; then
  display_removed_actions
elif [ "$1" == "toggle_border" ]; then
  toggle_border
elif [ "$1" == "sidecar" ]; then
  sidecar
elif [ "$1" == "sidecar_deac" ]; then
  sidecar_deactivate
elif [ -z "$1" ]; then
  echo "Invoked with no action"
fi
