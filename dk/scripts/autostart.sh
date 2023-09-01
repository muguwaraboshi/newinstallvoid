#!/bin/sh

xsetroot -cursor_name left_ptr &
xset r rate 350 35 &
xrandr --output DVI-0 --mode 1440x900_60.00 &
nitrogen --restore
picom &

