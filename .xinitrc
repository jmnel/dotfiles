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
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
exec i3 -c ~/.config/i3/i3.conf
#exec xmonad

#exec awesome
