#!/bin/bash

export GTK_THEME=Arc-Dark
export TERMINAL="konsole"
#export TERMINAL="terminator"
xrdb -load ~/.Xresources &
~/.fehbg &
xrandr --dpi 220
xset r rate 200 25
xbindkeys
exec i3 -c ~/.config/i3/i3.conf
#exec xmonad

#exec awesome
