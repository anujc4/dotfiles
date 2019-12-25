#!/usr/bin/env bash

case `uname` in
  Darwin)
    ./installation_scripts/first_run_mac.sh
  ;;
  Linux)
    ./installation_scripts/first_run_linux.sh
  ;;
esac