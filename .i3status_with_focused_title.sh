#!/bin/sh

# shell script to prepend i3status with more stuff

[ -z "$(whereis i3status)" ] && echo "Install i3status" && exit
[ -z "$(whereis xdotool)" ] && echo "Install xdotool" && exit

i3status | while read line; do
    title="$(xdotool getactivewindow getwindowname)"
    echo "$title | $line" || exit 1
done
