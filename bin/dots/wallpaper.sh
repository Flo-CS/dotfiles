#!/usr/bin/env bash

. $DOTS_DIR/bin/dots/utils.sh

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

main() {
	local command="$1"
	case "$command" in
	list)
		list_wallpapers
		;;
	set)
		local wallpaper="${2:-$(select_wallpaper)}"
		set_wallpaper "$wallpaper"
		;;
	esac
}

main "$@"
