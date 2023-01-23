case $@ in
"Brave Browser")
  icon_result=":brave_browser:"
  ;;
"FaceTime")
  icon_result=":face_time:"
  ;;
"Messages")
  icon_result=":messages:"
  ;;
"Twitter")
  icon_result=":twitter:"
  ;;
"ClickUp")
  icon_result=":click_up:"
  ;;
"Microsoft Edge")
  icon_result=":microsoft_edge:"
  ;;
"VLC")
  icon_result=":vlc:"
  ;;
"Notes")
  icon_result=":notes:"
  ;;
"Spark")
  icon_result=":spark:"
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
"Microsoft Word")
  icon_result=":microsoft_word:"
  ;;
"Microsoft Teams")
  icon_result=":microsoft_teams:"
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
"Notability")
  icon_result=":notability:"
  ;;
"WhatsApp")
  icon_result=":whats_app:"
  ;;
"VMware Fusion")
  icon_result=":vmware_fusion:"
  ;;
"Microsoft Excel")
  icon_result=":microsoft_excel:"
  ;;
"Microsoft PowerPoint")
  icon_result=":microsoft_power_point:"
  ;;
"Numbers")
  icon_result=":numbers:"
  ;;
"Default")
  icon_result=":default:"
  ;;
"Firefox Developer Edition" | "Firefox Nightly")
  icon_result=":firefox_developer_edition:"
  ;;
"Trello")
  icon_result=":trello:"
  ;;
"Notion")
  icon_result=":notion:"
  ;;
"Live")
  icon_result=":ableton:"
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
"Bitwarden")
  icon_result=":bit_warden:"
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
"Dropbox")
  icon_result=":dropbox:"
  ;;
"Safari" | "Safari Technology Preview")
  icon_result=":safari:"
  ;;
"Telegram")
  icon_result=":telegram:"
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
"Grammarly Editor")
  icon_result=":grammarly:"
  ;;
"Reminders")
  icon_result=":reminders:"
  ;;
"Preview" | "Skim" | "zathura")
  icon_result=":pdf:"
  ;;
"1Password 8")
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
"Alacritty" | "Hyper" | "iTerm2" | "kitty" | "Terminal" | "WezTerm")
  icon_result=":terminal:"
  ;;
*)
  icon_result=":default:"
  ;;
esac
echo $icon_result
