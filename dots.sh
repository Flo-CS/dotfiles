#!/usr/bin/env bash

set -euo pipefail # Exit on error, undefined variable, or failed command in a pipeline

. ./.dots/utils.sh

OPTIONS=("install" "set theme" "set wallpaper" "list themes" "list wallpapers")

selected_option=$(gum choose --header "What to do ?" "${OPTIONS[@]}")
case "$selected_option" in
"install")
	. ./.dots/install.sh
	;;
"set theme")
	. ./.dots/theme.sh set
	;;
"set wallpaper")
	. ./.dots/wallpaper.sh set
	;;
"list themes")
	. ./.dots/theme.sh list
	;;
"list wallpapers")
	. ./.dots/wallpaper.sh list
	;;
esac
