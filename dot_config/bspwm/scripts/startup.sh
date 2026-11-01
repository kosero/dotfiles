#!/usr/bin/env bash

run() {
	bin="$1"
	shift
	pgrep -f -- "$bin" > /dev/null && pkill -f -- "$bin"
	"$bin" "$@" &
}

run sxhkd -c "$HOME/.config/bspwm/sxhkdrc"
# run picom -b
run feh --bg-fill "$HOME/Pictures/wallpapers/lain.png"
run copyq
run dunst

run $HOME/.config/bspwm/scripts/low-bat-notifier.sh &
run $HOME/.config/bspwm/scripts/idle-poweroff.sh &
run $HOME/.config/bspwm/polybar/launch.sh &
