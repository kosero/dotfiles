#!/usr/bin/env bash

threshold_ms=$((3 * 60 * 60 * 1000))   # 3 hours

while :; do
	idle_ms=$(xprintidle)
	if [ "$idle_ms" -ge "$threshold_ms" ]; then
		systemctl poweroff
		break
	fi
	sleep 60
done
