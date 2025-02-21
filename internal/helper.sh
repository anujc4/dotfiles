#!/bin/bash

function is_installed() {
  local program=$1

  if command -v "$program" &>/dev/null; then
    return 0
  else
    return 1
  fi
}
