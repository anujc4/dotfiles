#!/usr/bin/env bash
# Paint sketchybar space items hosting a given app to flag attention.
# Stateless: callers run `set <app>`; yabai's space_changed signal triggers
# `clear <app>` via space_attention_on_focus.sh.

set -uo pipefail

source "$HOME/.config/common_wm/colors.sh"

ITEM_PREFIX="space."
DEFAULT_ATTENTION_COLOR="${SPACE_ATTENTION_COLOR:-$BLUE}"
RESET_ICON_COLOR="$WHITE"
RESET_LABEL_BG_COLOR="$BACKGROUND_2"

usage() {
  cat >&2 <<EOF
usage: $(basename "$0") set   <app> [--color HEX]
       $(basename "$0") clear <app>
EOF
  exit 64
}

spaces_for_app() {
  local app=$1
  yabai -m query --windows 2>/dev/null \
    | jq -r --arg app "$app" '[.[] | select(.app == $app) | .space] | unique | .[]' \
      2>/dev/null
}

focused_space() {
  yabai -m query --spaces --space 2>/dev/null | jq -r '.index // empty' 2>/dev/null
}

paint_space() {
  local space=$1 color=$2
  [[ "$space" =~ ^[0-9]+$ ]] || return 0
  sketchybar --animate sin 30 \
    --set "${ITEM_PREFIX}${space}" \
      icon.color="$color" \
      label.background.color="$color" >/dev/null 2>&1 || true
}

reset_space() {
  local space=$1
  [[ "$space" =~ ^[0-9]+$ ]] || return 0
  sketchybar --set "${ITEM_PREFIX}${space}" \
    icon.color="$RESET_ICON_COLOR" \
    label.background.color="$RESET_LABEL_BG_COLOR" >/dev/null 2>&1 || true
}

cmd="${1:-}"
shift || true

case "$cmd" in
  set)
    [[ $# -ge 1 ]] || usage
    app="$1"; shift
    color="$DEFAULT_ATTENTION_COLOR"
    while [[ $# -gt 0 ]]; do
      case "$1" in
        --color) color="${2:-}"; shift 2 ;;
        *) usage ;;
      esac
    done
    focused=$(focused_space)
    while IFS= read -r space; do
      [[ -n "$space" ]] || continue
      [[ "$space" == "$focused" ]] && continue
      paint_space "$space" "$color"
    done < <(spaces_for_app "$app")
    ;;
  clear)
    [[ $# -ge 1 ]] || usage
    app="$1"
    while IFS= read -r space; do
      [[ -n "$space" ]] || continue
      reset_space "$space"
    done < <(spaces_for_app "$app")
    ;;
  *) usage ;;
esac
