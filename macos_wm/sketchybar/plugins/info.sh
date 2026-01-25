#!/bin/bash

CAFFEINATE_FILE="/tmp/caffeinate_end_time"
CAFFEINATE_DURATION=14400  # 4 hours in seconds

update_caffeinate() {
  if pgrep -x caffeinate >/dev/null && [ -f "$CAFFEINATE_FILE" ]; then
    # Caffeinate is running - show remaining time
    END_TIME=$(cat "$CAFFEINATE_FILE")
    NOW=$(date +%s)
    REMAINING=$((END_TIME - NOW))

    if [ $REMAINING -gt 0 ]; then
      HOURS=$((REMAINING / 3600))
      MINUTES=$(((REMAINING % 3600) / 60))
      SECONDS=$((REMAINING % 60))
      TIME_STR=$(printf "%02d:%02d:%02d" $HOURS $MINUTES $SECONDS)

      sketchybar --set info.caffeinate \
        icon=􀀻 \
        icon.color=0xb3fb4934 \
        label="Stop Caffeinate ($TIME_STR)"
    else
      # Time expired, clean up
      pkill caffeinate
      rm -f "$CAFFEINATE_FILE"
      sketchybar --set info.caffeinate \
        icon=􀀹 \
        icon.color=0xb3b8bb26 \
        label="Caffeinate 4h"
    fi
  else
    # Caffeinate not running
    rm -f "$CAFFEINATE_FILE"
    sketchybar --set info.caffeinate \
      icon=􀀹 \
      icon.color=0xb3b8bb26 \
      label="Caffeinate 4h"
  fi
}

toggle_caffeinate() {
  if pgrep -x caffeinate >/dev/null; then
    # Stop caffeinate
    pkill caffeinate
    rm -f "$CAFFEINATE_FILE"
  else
    # Start caffeinate
    END_TIME=$(($(date +%s) + CAFFEINATE_DURATION))
    echo "$END_TIME" > "$CAFFEINATE_FILE"
    caffeinate -d -t $CAFFEINATE_DURATION &
  fi
  update_caffeinate
  sketchybar --set info.anchor popup.drawing=off
}

case "$SENDER" in
  "mouse.exited.global") sketchybar --set info.anchor popup.drawing=off ;;
  "routine") update_caffeinate ;;
  "caffeinate_toggle") toggle_caffeinate ;;
esac
