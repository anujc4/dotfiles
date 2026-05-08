#!/usr/bin/env bash

set -euo pipefail

source "$HOME/.config/common_wm/colors.sh"

ANCHOR="help_anchor"
PLUGIN_DIR="$HOME/.config/sketchybar/plugins/help"
CACHE_DIR="$HOME/.cache/sketchybar/help"
BINDINGS="$CACHE_DIR/bindings.tsv"
SWITCHES="$CACHE_DIR/switches.tsv"
STAMP_FILE="$CACHE_DIR/sources.mtime"
SKHDRC="$HOME/.config/skhd/skhdrc"

KEY_FONT="SF Mono:Bold:14.0"
LABEL_FONT="SF Pro:Regular:14.0"
KEY_WIDTH=190
ROW_HEIGHT=26

sources_mtime() {
  [[ -f "$SKHDRC" ]] || { printf 'no-sources'; return; }
  stat -f '%m' "$SKHDRC"
}

ensure_cache() {
  local current stored=""
  current="$(sources_mtime)"
  [[ -f "$STAMP_FILE" ]] && stored="$(cat "$STAMP_FILE")"
  if [[ ! -s "$BINDINGS" || ! -s "$SWITCHES" || "$current" != "$stored" ]]; then
    if "$PLUGIN_DIR/parse_skhd.lua"; then
      printf '%s' "$current" > "$STAMP_FILE"
    fi
  fi
}

drawing_state() {
  sketchybar --query "$ANCHOR" 2>/dev/null | jq -r '.popup.drawing // "off"'
}

render_keys() {
  local keys="$1"
  keys="${keys// + /+}"
  keys="${keys// - /-}"
  keys="${keys// /}"
  keys="${keys//0x2C/\/}"
  keys="${keys//0x18/=}"
  keys="${keys//0x24/return}"
  keys="${keys//0x2F/,}"
  keys="${keys//0x2B/.}"
  keys="${keys//0x1B/-}"
  printf '%s' "$keys"
}

capitalize() {
  local s="$1"
  local first="${s:0:1}"
  printf '%s%s' "$(printf '%s' "$first" | tr '[:lower:]' '[:upper:]')" "${s:1}"
}

clear_items() {
  sketchybar --remove '/help\.row\..*/' >/dev/null 2>&1 || true
}

build_items() {
  local mode="$1"
  local args=()
  local idx=0
  local name keys desc m to

  while IFS=$'\t' read -r m keys desc; do
    [[ "$m" == "$mode" ]] || continue
    [[ -n "${desc:-}" ]] || continue
    name="help.row.$idx"
    args+=( --add item "$name" "popup.$ANCHOR" \
            --set "$name" \
                  icon="$(render_keys "$keys")" \
                  icon.color="$AQUA" \
                  icon.font="$KEY_FONT" \
                  icon.width="$KEY_WIDTH" \
                  icon.align=left \
                  icon.padding_left=14 \
                  icon.padding_right=10 \
                  label="$desc" \
                  label.color="$WHITE" \
                  label.font="$LABEL_FONT" \
                  label.padding_left=8 \
                  label.padding_right=14 \
                  background.drawing=off \
                  background.height="$ROW_HEIGHT" )
    idx=$((idx + 1))
  done < "$BINDINGS"

  if grep -q "^${mode}	" "$SWITCHES"; then
    while IFS=$'\t' read -r m keys to; do
      [[ "$m" == "$mode" ]] || continue
      [[ -n "${to:-}" ]] || continue
      name="help.row.$idx"
      args+=( --add item "$name" "popup.$ANCHOR" \
              --set "$name" \
                    icon="$(render_keys "$keys")" \
                    icon.color="$AQUA" \
                    icon.font="$KEY_FONT" \
                    icon.width="$KEY_WIDTH" \
                    icon.align=left \
                    icon.padding_left=14 \
                    icon.padding_right=10 \
                    label="Switch to $(capitalize "$to") mode" \
                    label.color="$WHITE" \
                    label.font="$LABEL_FONT" \
                    label.padding_left=8 \
                    label.padding_right=14 \
                    background.drawing=off \
                    background.height="$ROW_HEIGHT" )
      idx=$((idx + 1))
    done < "$SWITCHES"
  fi

  if (( ${#args[@]} > 0 )); then
    sketchybar "${args[@]}" >/dev/null
  fi
}

show_for_mode() {
  local mode="$1"
  ensure_cache
  clear_items
  build_items "$mode"
  sketchybar --set "$ANCHOR" popup.drawing=on >/dev/null
}

cmd="${1:-}"
arg="${2:-}"

case "$cmd" in
  hide)
    sketchybar --set "$ANCHOR" popup.drawing=off >/dev/null 2>&1 || true
    ;;
  prewarm)
    ensure_cache
    ;;
  refresh)
    [[ -n "$arg" ]] || exit 0
    [[ "$(drawing_state)" == "on" ]] || exit 0
    show_for_mode "$arg"
    ;;
  default|stack|display|window|resize|inst)
    if [[ "$(drawing_state)" == "on" ]]; then
      sketchybar --set "$ANCHOR" popup.drawing=off >/dev/null
    else
      show_for_mode "$cmd"
    fi
    ;;
  *)
    cat >&2 <<EOF
usage: $(basename "$0") {default|stack|display|window|resize|inst}
       $(basename "$0") refresh <mode>
       $(basename "$0") hide
       $(basename "$0") prewarm
EOF
    exit 64
    ;;
esac
