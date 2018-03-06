#!/bin/bash

# opens a new terminal at path contained in the focused window title

[ -z "$(whereis i3-sensible-terminal)" ] && echo "Install i3-sensible-terminal" && exit
[ -z "$(whereis xdotool)" ] && echo "Install xdotool" && exit

title="$(xdotool getactivewindow getwindowname)"
# get everything from first to last slash
CURRENT_PATH=$(echo ${title} | perl -nE '$_ =~ m| ( ~?/[^\s]* ) |x; say "$1"')
# emulate tilda expansion for '[ -d .. ]' check, since it's used in a string
CURRENT_PATH="${CURRENT_PATH/\~/$HOME}"
# if file exist use its parent dir
[ -f "$CURRENT_PATH" ] && CURRENT_PATH="$(dirname $CURRENT_PATH)"
[ -d "$CURRENT_PATH" ] && cd "$CURRENT_PATH"
# guess and open terminal
i3-sensible-terminal
