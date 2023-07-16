#!/usr/bin/env sh

sketchybar --add item pomodoro right \
           --set pomodoro icon=祥 \
                          icon.font="$NERDFONT:White:16" \
                          click_script="$PLUGIN_DIR/pomodoro.sh"\
                          padding_left=4 \
                          padding_right=4
