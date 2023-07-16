MUSIC_EVENT="com.apple.Music.playerInfo"
POPUP_SCRIPT="sketchybar -m --set music.anchor popup.drawing=toggle"

sketchybar --add       event           music_change $MUSIC_EVENT        \
           --add       item            music.anchor center              \
           --subscribe music.anchor music_change                        \
           --set       music.anchor    icon=$MUSIC                      \
                                       label.font="$FONT:Bold:14.0"     \
                                       label.padding_left=10            \
                                       script="$PLUGIN_DIR/music.sh"    \
                                       associated_display=1             \
                                       click_script="$PLUGIN_DIR/music.sh"
                                  
                                       

           # --add       item            music.anchor center                \
           # --set       music.anchor    script="$PLUGIN_DIR/music.sh"      \
           #                             click_script="$POPUP_SCRIPT"         \
           #                             popup.horizontal=on                  \
           #                             popup.align=center                   \
           #                             popup.height=120                     \
           #                             icon=                               \
           #                             icon.font="$NERDFONT:Regular:25.0"       \
           #                             label.drawing=off                    \
           #                             drawing=off                          \
           #                             y_offset=2                           \
           # --subscribe music.anchor    mouse.entered mouse.exited           \
           #                             mouse.exited.global                  \
           #                                                                  \
           # --add       item            music.cover popup.music.anchor   \
           # --set       music.cover     script="$PLUGIN_DIR/music.sh"      \
           #                             label.drawing=off                    \
           #                             icon.drawing=off                     \
           #                             background.padding_left=12           \
           #                             background.padding_right=10          \
           #                             background.image.scale=0.15          \
           #                             background.image.drawing=on          \
           #                             background.drawing=on                \
           #                                                                  \
           # --add       item            music.title popup.music.anchor   \
           # --set       music.title     icon.drawing=off                     \
           #                             background.padding_left=0            \
           #                             background.padding_right=0           \
           #                             width=0                              \
           #                             label.font="$FONT:Heavy:14.0"        \
           #                             y_offset=40                          \
           #                                                                  \
           # --add       item            music.artist popup.music.anchor  \
           # --set       music.artist    icon.drawing=off                     \
           #                             y_offset=20                          \
           #                             background.padding_left=0            \
           #                             background.padding_right=0           \
           #                             width=0                              \
           #                                                                  \
           # --add       item            music.album popup.music.anchor   \
           # --set       music.album     icon.drawing=off                     \
           #                             background.padding_left=0            \
           #                             background.padding_right=0           \
           #                             y_offset=3                           \
           #                             width=0                              \
           #                                                                  \
           # --add       item            music.shuffle popup.music.anchor \
           # --set       music.shuffle   icon=咽                               \
           #                             icon.padding_left=5                  \
           #                             icon.padding_right=5                 \
           #                             icon.color=$BLACK                    \
           #                             icon.highlight_color=$MAGENTA        \
           #                             label.drawing=off                    \
           #                             script="$PLUGIN_DIR/music.sh"      \
           #                             y_offset=-30                         \
           # --subscribe music.shuffle mouse.clicked                        \
           #                                                                  \
           # --add       item            music.back popup.music.anchor    \
           # --set       music.back    icon=                               \
           #                             icon.padding_left=5                  \
           #                             icon.padding_right=5                 \
           #                             icon.color=$BLACK                    \
           #                             script="$PLUGIN_DIR/music.sh"      \
           #                             label.drawing=off                    \
           #                             y_offset=-30                         \
           # --subscribe music.back      mouse.clicked                        \
           #                                                                  \
           # --add       item            music.play popup.music.anchor    \
           # --set       music.play      icon=契                               \
           #                             background.height=40                 \
           #                             background.corner_radius=20          \
           #                             width=40                             \
           #                             align=center                         \
           #                             background.color=$BLACK              \
           #                             background.border_color=$WHITE       \
           #                             background.border_width=0            \
           #                             background.drawing=on                \
           #                             icon.padding_left=4                  \
           #                             icon.padding_right=5                 \
           #                             icon.color=$WHITE                    \
           #                             updates=on                           \
           #                             label.drawing=off                    \
           #                             script="$PLUGIN_DIR/music.sh"      \
           #                             y_offset=-30                         \
           # --subscribe music.play      mouse.clicked music_change         \
           #                                                                  \
           # --add       item            music.next popup.music.anchor    \
           # --set       music.next      icon=                               \
           #                             icon.padding_left=5                  \
           #                             icon.padding_right=10                \
           #                             icon.color=$BLACK                    \
           #                             label.drawing=off                    \
           #                             script="$PLUGIN_DIR/music.sh"      \
           #                             y_offset=-30                         \
           # --subscribe music.next      mouse.clicked                        \
           #                                                                  \
           # --add       item            music.repeat popup.music.anchor  \
           # --set       music.repeat    icon=凌                               \
           #                             icon.highlight_color=$MAGENTA        \
           #                             icon.padding_left=5                  \
           #                             icon.padding_right=10                \
           #                             icon.color=$BLACK                    \
           #                             label.drawing=off                    \
           #                             script="$PLUGIN_DIR/music.sh"      \
           #                             y_offset=-30                         \
           # --subscribe music.repeat    mouse.clicked                        \
           #                                                                  \
           # --add       item            music.spacer popup.music.anchor  \
           # --set       music.spacer    width=5                              \
           #                                                                  \
           # --add      bracket          music   music.shuffle              \
           #                                     music.back                 \
           #                                     music.play                 \
           #                                     music.next                 \
           #                                     music.repeat               \
           # --set      music            background.color=$GREEN              \
           #                             background.corner_radius=11          \
           #                             background.drawing=on                \
           #                             y_offset=-30                         \
           #                             drawing=off
