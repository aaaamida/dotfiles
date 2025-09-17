#!/run/current-system/sw/bin/zsh

if pgrep -x ".waybar-wrapped" > /dev/null; then
    killall -SIGUSR1 .waybar-wrapped
else
    waybar -c ~/.config/waybar/config.jsonc
fi
