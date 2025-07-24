#!/bin/zsh

if pgrep -x "waybar" > /dev/null; then
    killall -SIGUSR1 waybar
else
    waybar -c ~/.config/waybar/config.jsonc &
fi
