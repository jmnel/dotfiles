#!/bin/bash

source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh

export GTK_THEME=Arc-Dark
export TERMINAL="alacritty"
export terminal="${TERMINAL}"
export GDK_SCALE=1
export GDK_DPI_SCALE=1.6
xrdb -m ~/.Xresources
#[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap
~/.fehbg &
xrandr --dpi 200
xinput --set-prop bcm5972 "libinput Disable While Typing enabled" 0
export SSH_AUTH_SOCK
xbindkeys

xset r rate 200 40
exec i3 -c ~/.config/i3/i3.conf
