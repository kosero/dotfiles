#!/usr/bin/env bash

pkill -u $UID -x polybar || true

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

polybar main -c "$HOME/.config/bspwm/polybar/config.ini" 2>&1 | tee -a /tmp/polybar.log & disown

echo "Polybar launched..."
