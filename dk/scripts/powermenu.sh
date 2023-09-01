#!/bin/sh


# Options for powermenu 
lock="  Lock"
logout="  Logout"
shutdown="  Shutdown"
reboot="  Reboot"
sleep="  Sleep"

## Get answer from user via rofi
selected_option=$(echo "$lock
$logout
$sleep
$reboot
$shutdown" | rofi -dmenu\
                  -i\
                  -p "power"\
                  -config "~/.config/rofi/config.rasi"\
                  -font  "JetBrains Mono Nerd Font 10"\
                  -width "15"\
                  -lines 5\
                  -line-margin 3\
                  -line-padding 10\
                  -scrollbar-width "0" )

## Do something based on selected option
if [ "$selected_option" == "$lock" ]
then
    ~/.config/spectrwm/scripts/lock.sh 
elif [ "$selected_option" == "$logout" ]
then
    pkill dk
elif [ "$selected_option" == "$shutdown" ]
then
    loginctl poweroff
elif [ "$selected_option" == "$reboot" ]
then
    loginctl reboot
elif [ "$selected_option" == "$suspend" ]
then
    ##amixer set Master mute
    loginctl suspend
else
    echo "No match"
fi

