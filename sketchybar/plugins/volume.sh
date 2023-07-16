#!/bin/bash

WIDTH=100

volume_change() {
  source "$HOME/.config/sketchybar/icons.sh"

  if [ "$(SwitchAudioSource -c -t output)" == "LG ULTRAGEAR" ]; then
    ICON=$VOLUME_66
  else
    case $INFO in
      [6-9][0-9]|100) ICON=$VOLUME_100
      ;;
      [3-5][0-9]) ICON=$VOLUME_66
      ;;
      [1-2][0-9]) ICON=$VOLUME_33
      ;;
      [1-9]) ICON=$VOLUME_10
      ;;
      0) ICON=$VOLUME_0
      ;;
      *) ICON=$VOLUME_100
    esac
  fi

  sketchybar --set volume_icon label=$ICON

  sketchybar --set $NAME slider.percentage=$INFO \
             --animate tanh 30 --set $NAME slider.width=$WIDTH 

  sleep 2

  # Check wether the volume was changed another time while sleeping
  FINAL_PERCENTAGE=$(sketchybar --query $NAME | jq -r ".slider.percentage")
  if [ "$FINAL_PERCENTAGE" -eq "$INFO" ]; then
    sketchybar --animate tanh 30 --set $NAME slider.width=0
  fi
}

mouse_clicked() {
if [ "$(SwitchAudioSource -c -t output)" == "LG ULTRAGEAR" ]; then
  ddcctl -d 1 -v $PERCENTAGE
else
  osascript -e "set volume output volume $PERCENTAGE"
fi
}

mouse_entered() {
  sketchybar --set $NAME slider.knob.drawing=on
}

mouse_exited() {
  sketchybar --set $NAME slider.knob.drawing=off
}

case "$SENDER" in
  "volume_change") volume_change
  ;;
  "mouse.clicked") mouse_entered; mouse_clicked; 
  ;;
  "mouse.exited") mouse_exited;
  ;;
esac
