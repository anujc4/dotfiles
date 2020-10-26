zsh_wifi_signal_mac() {
  local output=$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport -I)
  local airport=$(echo $output | grep 'AirPort' | awk -F': ' '{print $2}')

  if [ "$airport" = "Off" ]; then
    echo "Offline"
  else
    echo $(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport -I | grep ' SSID' | awk -F': ' 'echo $2') $(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport -I | grep 'lastTxRate' | awk -F': ' '{print $2}') Mb/s
  fi
}

zsh_wifi_signal_linux() {
  local signal=$(nmcli device wifi | grep '*' | awk '{print $7}')
  echo "$signal MBit/s"
}

case `uname` in
  Darwin)
    zsh_wifi_signal_mac
  ;;
  Linux)
    zsh_wifi_signal_linux
  ;;
esac