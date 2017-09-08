#!/bin/bash

source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh

export GTK_THEME=Arc-Dark
export TERMINAL="konsole"
export terminal="konsole"
export GDK_SCALE=2
xrdb -load ~/.Xresources &
~/.fehbg &
xrandr --dpi 220
xset r rate 200 25
xbindkeys
exec i3 -c ~/.config/i3/i3.conf
#exec xmonad

#exec awesome
