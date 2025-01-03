#!/usr/bin/env bash

dir="$HOME/.config/polybar"
style=${1:-"default"}

launch_bar() {
	# Terminate already running bar instances
	killall -q polybar

	# Wait until the processes have been shut down
	while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

	# Launch the bar
	polybar -q main -c "$dir/themes/$style/config.ini" &	
}

launch_bar
