#!/usr/bin/env sh

sketchybar --add item battery right                      \
           --set battery script="$PLUGIN_DIR/battery.sh" \
                         update_freq=10                  \
                         icon.padding_left=8             \
           --subscribe battery system_woke               \
            
           




