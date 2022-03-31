#!/usr/bin/env bash

# Add this script to your wm startup file.
DIR="$HOME/.config/polybar"

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch the bar
polybar -q top-main -c "$DIR"/config.ini &
polybar -q bottom-main -c "$DIR"/config.ini &

#for m in $(xrandr | grep " connected [0-9]" | cut -d":" -f1); do
#  MONITOR=$m polybar --reload top &
#done

# IPC settings and test
ln -sf /tmp/polybar_mqueue.$! /tmp/ipc-main
echo message >/tmp/ipc-main
