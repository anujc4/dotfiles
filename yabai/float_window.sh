# check if there is exactly one window belonging to the process of the window that was just created
if yabai -m query --windows | jq -re 'map(select(.id | tostring == env.YABAI_WINDOW_ID).pid)[0] as $pid | map(select(.pid == $pid)) | length == 1' >  /dev/null
then
    # unfloat the window
    yabai -m window "${YABAI_WINDOW_ID}"  --toggle float
fi
