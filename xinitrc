#!/bin/env bash
xset -dpms
xset s off
xset -b

[ -f "$HOME/.Xresources" ] && xrdb -load "$HOME/.Xresources"

exec /usr/bin/i3 -V
