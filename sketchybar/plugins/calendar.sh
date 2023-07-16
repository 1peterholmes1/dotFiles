#!/bin/sh

PLUGIN_DIR="$HOME/.config/sketchybar/plugins"
sketchybar --set calendar icon="$(date '+%a %d. %b')" label="$(date '+%H:%M')"
