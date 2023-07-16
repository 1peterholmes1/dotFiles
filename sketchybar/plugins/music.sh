#!/bin/sh
TRACKNAME=$(osascript -e 'tell application "Music" to get name of current track')
ARTISTNAME=$(osascript -e 'tell application "Music" to get artist of current track')
MAXLENGTH=80
if [ $(osascript -e 'tell application "Music" to get player state') == "playing" ]; then
  if [ ${#TRACKNAME} -ge $MAXLENGTH ]; then
    sketchybar --set music.anchor label="Playing"
  elif [ $((${#TRACKNAME} + ${#ARTISTNAME})) -ge $MAXLENGTH ]; then
    sketchybar --set music.anchor label="$TRACKNAME"
  else
   sketchybar --set music.anchor label="$TRACKNAME - $ARTISTNAME"
  fi
else
  sketchybar --set music.anchor label=""
fi

if [ $SENDER == "forced" ]; then
  if [ "$BUTTON" == "left" ]; then
    osascript -e 'tell application "Music" to playpause'
  elif [ "$BUTTON" == "right" ]; then    
    osascript -e 'tell application "Music" to play next track'
  fi
fi

# next ()
# {
#   osascript -e 'tell application "Music" to play next track'
# }
#
# back () 
# {
#   osascript -e 'tell application "Music" to play previous track'
# }
#
# play () 
# {
#   osascript -e 'tell application "Music" to playpause'
# }
#
# repeat () 
# {
#   REPEAT=$(osascript -e 'tell application "Music" to get song repeat')
#   if [ "$REPEAT" = "off" ]; then
#     sketchybar -m --set music.repeat icon.highlight=on
#     osascript -e 'tell application "Music" to set song repeat to all'
#   else 
#     sketchybar -m --set music.repeat icon.highlight=off
#     osascript -e 'tell application "Music" to set song repeat to off'
#   fi
# }
#
# shuffle () 
# {
#   SHUFFLE=$(osascript -e 'tell application "Music" to get shuffle enabled')
#   if [ "$SHUFFLE" = "false" ]; then
#     sketchybar -m --set music.shuffle icon.highlight=on
#     osascript -e 'tell application "Music" to set shuffling to true'
#   else 
#     sketchybar -m --set music.shuffle icon.highlight=off
#     osascript -e 'tell application "Music" to set shuffling to false'
#   fi
# }
#
# update ()
# {
#   PLAYING=1
#   if [ "$(echo "$INFO" | jq -r '.["Player State"]')" = "Playing" ]; then
#     PLAYING=0
#     TRACK="$(echo "$INFO" | jq -r .Name | sed 's/\(.\{20\}\).*/\1.../')"
#     ARTIST="$(echo "$INFO" | jq -r .Artist | sed 's/\(.\{20\}\).*/\1.../')"
#     ALBUM="$(echo "$INFO" | jq -r .Album | sed 's/\(.\{25\}\).*/\1.../')"
#     SHUFFLE=$(osascript -e 'tell application "Music" to get shuffle enabled')
#     REPEAT=$(osascript -e 'tell application "Music" to get song repeat')
#   fi
#
#   args=()
#   if [ $PLAYING -eq 0 ]; then
#     osascript ~/.config/sketchybar/albumart.scpt
#     args+=(--set music.title label="$TRACK" drawing=on \
#            --set music.album label="$ALBUM" drawing=on \
#            --set music.artist label="$ARTIST" drawing=on)
#
#     args+=(--set music.play icon=􀊆 \
#            --set music.shuffle icon.highlight=$SHUFFLE \
#            --set music.repeat icon.highlight=$REPEAT \
#            --set music.cover background.image="/tmp/albumart.jpg" \
#                                background.color=0x00000000 \
#            --set music.anchor drawing=on \
#            --set music drawing=on                               )
#   else
#     args+=(--set music.title drawing=off \
#            --set music.artist drawing=off \
#            --set music.anchor drawing=off popup.drawing=off \
#            --set music.play icon=􀊄                           )
#   fi
#   sketchybar -m "${args[@]}"
# }
#
# mouse_clicked () {
#   case "$NAME" in
#     "music.next") next
#     ;;
#     "music.back") back
#     ;;
#     "music.play") play
#     ;;
#     "music.shuffle") shuffle
#     ;;
#     "music.repeat") repeat
#     ;;
#     *) exit
#     ;;
#   esac
# }
#
# popup () {
#   sketchybar --set music.anchor popup.drawing=$1
# }
#
# case "$SENDER" in
#   "mouse.clicked") mouse_clicked
#   ;;
#   "mouse.entered") popup on
#   ;;
#   "mouse.exited"|"mouse.exited.global") popup off
#   ;;
#   *) update
#   ;;
# esac
