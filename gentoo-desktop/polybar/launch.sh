#!/usr/bin/env sh

killall -q polybar

while pgrep -x polybar >/dev/null; do sleep 1; done

polybar -l info -c $HOME/.config/polybar/config main &
polybar -l info -c $HOME/.config/polybar/config left &
