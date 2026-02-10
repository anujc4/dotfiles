#!/bin/bash

update_ips() {
  # Get internal IP (try en0 first, then en1)
  INTERNAL_IP=$(ipconfig getifaddr en0 2>/dev/null)
  if [ -z "$INTERNAL_IP" ]; then
    INTERNAL_IP=$(ipconfig getifaddr en1 2>/dev/null)
  fi
  if [ -z "$INTERNAL_IP" ]; then
    INTERNAL_IP="Not connected"
  fi

  # Get external IP
  EXTERNAL_IP=$(curl -s --max-time 3 https://api.ipify.org 2>/dev/null)
  if [ -z "$EXTERNAL_IP" ]; then
    EXTERNAL_IP="Unavailable"
  fi

  sketchybar --set network.internal label="Internal: $INTERNAL_IP" \
             --set network.external label="External: $EXTERNAL_IP"
}

case "$SENDER" in
  "mouse.exited.global") sketchybar --set network.anchor popup.drawing=off ;;
  *) update_ips ;;
esac
