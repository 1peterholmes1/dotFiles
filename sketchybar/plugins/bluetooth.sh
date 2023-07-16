#!/bin/bash

AUDSOURCE=$(switchaudiosource -c)
AP="Peter’s AirPods Pro"
SONY="WH-1000XM4"
SPEAKERNAME="LG ULTRAGEAR"

if [ "$AUDSOURCE" = "$AP" ]; then
  sketchybar --set bluetooth icon.color=0xff8aadf4
elif [ "$AUDSOURCE" = "$SONY" ]; then
  sketchybar --set bluetooth icon.color=0xffed8796
elif [ "$AUDSOURCE" = "$SPEAKERNAME" ]; then
  sketchybar --set bluetooth icon.color=0xff7ed321
else 
  sketchybar --set bluetooth icon.color=0xffffffff
fi



