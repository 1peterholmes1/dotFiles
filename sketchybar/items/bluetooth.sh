#!/usr/bin/env sh

POPUP_OFF="sketchybar --set bluetooth popup.drawing=off"
POPUP_CLICK_SCRIPT="sketchybar --set \$NAME popup.drawing=toggle"
BLUETOOTH_CONNECTED="com.apple.bluetooth.status"

sketchybar --add item bluetooth right                         \
           --set bluetooth icon=$BLUETOOTH                    \
                           icon.font="$NERDFONT:White:18"      \
                           click_script="$POPUP_CLICK_SCRIPT" \
                           label.drawing=off                  \
                           background.padding_right=14        \
                           background.padding_left=10         \
                           icon.padding_left=4                \
                           script="$PLUGIN_DIR/bluetooth.sh"  \
           --add event bluetooth_connected $BLUETOOTH_CONNECTED \
           --subscribe bluetooth bluetooth_connected          \
                                                              \
           --add item      bluetooth.airpods popup.bluetooth  \
           --set bluetooth.airpods icon=$APPLE                \
                                   label="Connect AirPods"    \
                                   click_script="$POPUP_OFF; 
                                                 BluetoothConnector --connect 44-1b-88-e7-51-70;
                                                 switchaudiosource -i 98;" \
           --add item      bluetooth.headphones popup.bluetooth  \
           --set bluetooth.headphones icon=$HEADPHONES           \
                                   label="Connect Headphones"    \
                                   click_script="$POPUP_OFF; 
                                                 BluetoothConnector --connect 88-c9-e8-01-b8-78;"
           # --add item      bluetooth.speakers popup.bluetooth  \
           # --set bluetooth.speakers icon=$SPEAKERS           \
           #                         label="Desk Speakers"    \
           #                         click_script="switchaudiosource -i 102;
           #                                        $POPUP_OFF" \
           # # --add item sound right                             \
           # --set sound icon=$VOLUME_ICON                      \
           #             icon.font="$NERDFONT:White:18"         \
           #             click_script="$POPUP_CLICK_SCRIPT"     \
           # --add item sound.up popup.sound                    \
           # --set sound.up icon=$VOLUP                         \
           #                label=""                            \
                          # click_script=""

