#!/bin/bash
#
SLIDERWIDTH=100
# HEADPHONES_COLOR=$RED
# AIRPODS_COLOR=$BLUE
# SPEAKERS_COLOR=$GREEN
# DEFAULT_COLOR=$WHITE

detail_on() {
  echo "in detail on" >> ~/.config/sketchybar/log.log
  echo "sliderwidth = $SLIDERWIDTH" >> ~/.config/sketchybar/log.log
  sketchybar --animate tanh 30 --set volume slider.width=$SLIDERWIDTH
}

detail_off() {
  sketchybar --animate tanh 30 --set volume slider.width=0
}

toggle_detail() {
  INITIAL_WIDTH=$(sketchybar --query volume | /Users/peter/opt/anaconda3/bin/jq -r '.slider.width')
  echo "which jq: $(which jq)" >> ~/.config/sketchybar/log.log
  echo "in toggle detail, init width = $INITIAL_WIDTH" >> ~/.config/sketchybar/log.log
  if [ "$INITIAL_WIDTH" -eq "0" ]; then
    echo "width == 0" >> ~/.config/sketchybar/log.log
    detail_on
  else
    detail_off
  fi
}

# get_color() {
#   case "$1" in
#     "Peter's Airpods") COLOR=$AIRPODS_COLOR
#     ;;
#     "WH-1000XM4") COLOR=$HEADPHONES_COLOR
#     ;;
#     "LG ULTRAGEAR") COLOR=$SPEAKERS_COLOR
#     ;;
#     *) COLOR=$DEFAULT_COLOR
#   esac
#
# }

toggle_devices() {
  which SwitchAudioSource >/dev/null || exit 0
  source "$HOME/.config/sketchybar/colors.sh"

  args=(--remove '/volume.device\.*/' --set "$NAME" popup.drawing=toggle)
  COUNTER=0
  CURRENT="$(SwitchAudioSource -t output -c)"
  while IFS= read -r device; do
    COLOR=$GREY
    if [ "${device}" = "$CURRENT" ]; then
      COLOR=$WHITE
    fi
    args+=(--add item volume.device.$COUNTER popup."$NAME" \
           --set volume.device.$COUNTER label="${device}" \
                                        label.color="$COLOR" \
                 click_script="SwitchAudioSource -s \"${device}\" && sketchybar --set /volume.device\.*/ label.color=$GREY --set \$NAME label.color=$WHITE --set $NAME popup.drawing=off")
    COUNTER=$((COUNTER+1))
  done <<< "$(SwitchAudioSource -a -t output)"

  sketchybar -m "${args[@]}" > /dev/null
}

if [ "$BUTTON" = "right" ] || [ "$MODIFIER" = "shift" ]; then
  echo "right click or shift click" >> ~/.config/sketchybar/log.log
  toggle_devices
else
  echo "left click" >> ~/.config/sketchybar/log.log
  sketchybar --set "$NAME" popup.drawing=off
  toggle_detail
fi
