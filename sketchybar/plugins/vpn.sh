#!/usr/bin/env sh

STATE=$(osascript -e 'tell application "Tunnelblick" to get state of first configuration')
if [ $STATE == "CONNECTED" ]; then
  sketchybar --set vpn icon.color=0xff8aadf4
  if [ $1 == "click" ]; then
    osascript -e 'tell application "Tunnelblick" to disconnect all'
    sketchybar --set vpn icon.color=0xffffffff
  fi
else
  sketchybar --set vpn icon.color=0xffffffff
  if [ $1 == "click" ]; then
    osascript -e 'tell application "Tunnelblick" to connect all'
    sketchybar --set vpn icon.color=0xff8aadf4
  fi
fi



