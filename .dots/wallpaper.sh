#!/usr/bin/env bash

WALLPAPERS_PATH="$DOTS_DIR/assets/wallpapers"

set_wallpaper() {
	symlink assets/wallpapers/$1 ~/.local/share/wallpapers/current
	hyprctl hyprpaper reload , ~/.local/share/wallpapers/current
}

list_wallpapers() {
	find "$WALLPAPERS_PATH" -mindepth 1 -maxdepth 1 -type f ! -lname '*' -printf '%f\n'
}

select_wallpaper() {
	gum choose --header "Select a wallpaper" $(list_wallpapers)
}

case "$1" in
list)
	list_wallpapers
	;;
set)
	set_wallpaper $(select_wallpaper)
	;;
esac
