#!/bin/bash

zsh_wifi_signal_mac() {
  local output
  local airport

  output=$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport -I)
  airport=$(echo "$output" | grep 'AirPort' | awk -F': ' '{print $2}')

  if [ "$airport" = "Off" ]; then
    echo "Offline"
  else
    echo "$(echo "$output" | grep ' SSID' | xargs | awk -F': ' 'echo $2' | sed 's/SSID: //')" \
         "$(echo "$output" | grep 'lastTxRate' | awk -F': ' '{print $2}')" Mb/s
  fi
}

zsh_wifi_signal_linux() {
  local signal
  signal=$(nmcli device wifi | grep '*' | awk '{print $7}')
  echo "$signal MBit/s"
}

case $(uname) in
  Darwin)
    zsh_wifi_signal_mac
  ;;
  Linux)
    zsh_wifi_signal_linux
  ;;
esac
