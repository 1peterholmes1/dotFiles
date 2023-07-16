##!/usr/bin/env sh

sketchybar --add item vpn right                         \
           --set vpn icon=$VPN                    \
                           icon.font="$NERDFONT:White:18"      \
                           click_script="$PLUGIN_DIR/vpn.sh click" \
                           script="$PLUGIN_DIR/vpn.sh noclick"       \
                           label.drawing=off                  \
                           background.padding_right=4        \
                           background.padding_left=4         \
                           update_freq=30                     \
                           label.font="$NERDFONT:White:18"   \
                           label.drawing=on                  \
                           
          

