#!/usr/bin/env bash
# Triggered by yabai's space_changed signal. Clears attention marks for any
# app that has a window on the newly-focused space ($YABAI_SPACE_INDEX).

set -uo pipefail

[[ -n "${YABAI_SPACE_INDEX:-}" ]] || exit 0

apps=$(yabai -m query --windows --space "$YABAI_SPACE_INDEX" 2>/dev/null \
  | jq -r '[.[].app] | unique | .[]' 2>/dev/null)
[[ -n "$apps" ]] || exit 0

PLUGIN_DIR="$(cd "$(dirname "$0")" && pwd)"

while IFS= read -r app; do
  [[ -n "$app" ]] || continue
  "$PLUGIN_DIR/space_attention.sh" clear "$app" >/dev/null 2>&1 || true
done <<< "$apps"
