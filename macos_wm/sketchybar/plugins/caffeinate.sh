#!/bin/bash

source "$HOME/.config/common_wm/colors.sh"

CAFFEINATE_PID_FILE="/tmp/caffeinate_pid"

is_caffeinate_running() {
  if [ -f "$CAFFEINATE_PID_FILE" ]; then
    PID=$(cat "$CAFFEINATE_PID_FILE")
    if ps -p "$PID" >/dev/null 2>&1; then
      return 0
    fi
  fi
  return 1
}

update_caffeinate() {
  if is_caffeinate_running; then
    sketchybar --set caffeinate \
      icon.color=$GREEN
  else
    sketchybar --set caffeinate \
      icon.color=$RED
  fi
}

toggle_caffeinate() {
  if is_caffeinate_running; then
    # Stop caffeinate
    PID=$(cat "$CAFFEINATE_PID_FILE")
    kill "$PID" 2>/dev/null
    rm -f "$CAFFEINATE_PID_FILE"
  else
    # Start caffeinate permanently (no timeout)
    caffeinate -d &
    echo $! > "$CAFFEINATE_PID_FILE"
  fi
  update_caffeinate
}

case "$SENDER" in
  "routine"|"forced") update_caffeinate ;;
  "caffeinate_toggle") toggle_caffeinate ;;
esac
