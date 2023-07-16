#!/bin/sh

CLICKSCRIPT="open -a 'Activity Monitor'"

sketchybar --add alias "Stats,RAM_mini" right            \
           --set "Stats,RAM_mini" label.padding_left=0   \
           --set "Stats,RAM_mini" icon.padding_left=0    \
           --set "Stats,RAM_mini" width=28  \
           --set "Stats,RAM_mini" label.padding_right=0 \
           --set "Stats,RAM_mini" label.width=0 \
           --set "Stats,RAM_mini" click_script="$CLICKSCRIPT" \
           --add alias "Stats,CPU_line_chart" right      \
           --set "Stats,CPU_line_chart" label.padding_right=0 \
           --set "Stats,CPU_line_chart" icon.padding_right=0 \
           --set "Stats,CPU_line_chart" click_script="$CLICKSCRIPT"
