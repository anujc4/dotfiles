#!/usr/bin/env bash

# Key Remapping for hidutil
# Non-US backslash (0x700000064) -> Tilde/Grave (0x700000035)
# Caps Lock (0x700000039) -> Escape (0x700000029)

# Apply key mappings
hidutil property --set '{
  "UserKeyMapping":[
    {
      "HIDKeyboardModifierMappingSrc": 0x700000064,
      "HIDKeyboardModifierMappingDst": 0x700000035
    },
    {
      "HIDKeyboardModifierMappingSrc": 0x700000039,
      "HIDKeyboardModifierMappingDst": 0x700000029
    }
  ]
}'

# Check if the command succeeded
if [ $? -eq 0 ]; then
    echo "$(date): Key mappings applied successfully"
else
    echo "$(date): Failed to apply key mappings" >&2
    exit 1
fi
