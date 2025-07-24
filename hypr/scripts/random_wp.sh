#!/bin/zsh

function randomise_wp() {
        WALLPAPER_DIR="$HOME/.config/hypr/hyprpaper/"
        CURRENT_WALL=$(hyprctl hyprpaper listloaded)

        WALLPAPER=$(find "$WALLPAPER_DIR" -type f ! -name "$(basename "$CURRENT_WALL")" | shuf -n 1)

        hyprctl hyprpaper reload ,"$WALLPAPER"

        sleep 21600
        randomise_wp()
}

