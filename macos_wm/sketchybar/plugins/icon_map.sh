#!/usr/bin/env bash

case $@ in
"Activity Monitor")
  icon_result=":activity_monitor:"
  ;;
"Brave Browser")
  icon_result=":brave_browser:"
  ;;
"FaceTime")
  icon_result=":face_time:"
  ;;
"Messages")
  icon_result=":messages:"
  ;;
"VLC")
  icon_result=":vlc:"
  ;;
"Notes")
  icon_result=":notes:"
  ;;
"GitButler")
  icon_result=":git_hub:"
  ;;
"GitHub Desktop")
  icon_result=":git_hub:"
  ;;
"App Store")
  icon_result=":app_store:"
  ;;
"Chromium" | "Google Chrome" | "Google Chrome Canary")
  icon_result=":google_chrome:"
  ;;
"zoom.us")
  icon_result=":zoom:"
  ;;
"Color Picker")
  icon_result=":color_picker:"
  ;;
"WebStorm")
  icon_result=":web_storm:"
  ;;
"RubyMine")
  icon_result=":idea:"
  ;;
"Neovide" | "MacVim" | "Vim" | "VimR")
  icon_result=":vim:"
  ;;
"Sublime Text")
  icon_result=":sublime_text:"
  ;;
"Setapp")
  icon_result=":setapp:"
  ;;
"WhatsApp")
  icon_result=":whats_app:"
  ;;
"Numbers")
  icon_result=":numbers:"
  ;;
"Firefox Developer Edition" | "Firefox Nightly")
  icon_result=":firefox_developer_edition:"
  ;;
"Notion")
  icon_result=":notion:"
  ;;
"Calendar" | "Fantastical")
  icon_result=":calendar:"
  ;;
"Android Studio")
  icon_result=":android_studio:"
  ;;
"Xcode")
  icon_result=":xcode:"
  ;;
"Slack")
  icon_result=":slack:"
  ;;
"Sequel Pro")
  icon_result=":sequel_pro:"
  ;;
"System Preferences" | "System Settings")
  icon_result=":gear:"
  ;;
"Discord" | "Discord Canary" | "Discord PTB")
  icon_result=":discord:"
  ;;
"Firefox")
  icon_result=":firefox:"
  ;;
"Safari" | "Safari Technology Preview")
  icon_result=":safari:"
  ;;
"Keynote")
  icon_result=":keynote:"
  ;;
"Spotify")
  icon_result=":spotify:"
  ;;
"Figma")
  icon_result=":figma:"
  ;;
"Spotlight")
  icon_result=":spotlight:"
  ;;
"Music")
  icon_result=":music:"
  ;;
"Insomnia")
  icon_result=":insomnia:"
  ;;
"Pages")
  icon_result=":pages:"
  ;;
"Folx")
  icon_result=":folx:"
  ;;
"Android Messages")
  icon_result=":android_messages:"
  ;;
"Pi-hole Remote")
  icon_result=":pihole:"
  ;;
"IntelliJ IDEA")
  icon_result=":idea:"
  ;;
"Drafts")
  icon_result=":drafts:"
  ;;
"Obsidian")
  icon_result=":obsidian:"
  ;;
"Reminders")
  icon_result=":reminders:"
  ;;
"Preview" | "Skim" | "zathura")
  icon_result=":pdf:"
  ;;
"1Password")
  icon_result=":one_password:"
  ;;
"Code" | "Code - Insiders")
  icon_result=":code:"
  ;;
"VSCodium")
  icon_result=":vscodium:"
  ;;
"Finder" | "ForkLift")
  icon_result=":finder:"
  ;;
"Signal")
  icon_result=":signal:"
  ;;
"Hyper" | "iTerm2" | "kitty" | "Terminal" | "WezTerm")
  icon_result=":terminal:"
  ;;
"Alacritty")
  icon_result=":alacritty:"
  ;;
"Default")
  icon_result=":default:"
  ;;
*)
  icon_result=":default:"
  ;;
esac
echo $icon_result
