#!/bin/bash

if ! command -v xdotool >/dev/null 2>&1; then
    notify-send "Error" "xdotool is not installed.\nInstall it to enable lock cancellation."
    exit 1
fi

notify-send 'Locking session' 'Locking in 10sec'

read X1 Y1 <<< "$(xdotool getmouselocation --shell | awk -F= '
/^X=/ {x=$2}
/^Y=/ {y=$2}
END {print x, y}')"


sleep 10

read X2 Y2 <<< "$(xdotool getmouselocation --shell | awk -F= '
/^X=/ {x=$2}
/^Y=/ {y=$2}
END {print x, y}')"

if [[ "$X1" != "$X2" || "$Y1" != "$Y2" ]]; then
    notify-send "Lock cancelled" "Mouse moved."
    exit 0
fi

i3lock --nofork
