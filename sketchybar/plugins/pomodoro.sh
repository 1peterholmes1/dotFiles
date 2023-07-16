#!/bin/bash

if [ "$BUTTON" == "left" ]; then 
  osascript -e 'tell application "iTerm" to create window with profile "Timer25"' 
else 
  osascript -e 'tell application "iTerm" to create window with profile "Timer5"' 
fi
