#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Open Selection in Neovim
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 📝

# Get the path of the currently selected file in Finder
SELECTED_FILE=$(osascript -e 'tell application "Finder" to set theSelection to selection
if theSelection is {} then
    return ""
else
    return POSIX path of (item 1 of theSelection as text)
fi')

if [ -z "$SELECTED_FILE" ]; then
  echo "No file selected in Finder"
  exit 1
fi

# Open the file in your preferred terminal emulator.
# Examples:

# For iTerm2:
# open -a iTerm "$SELECTED_FILE" -e nvim

# For Ghostty:
ghostty -e nvim "$SELECTED_FILE"

# For macOS Terminal:
# open -a Terminal "$SELECTED_FILE"
