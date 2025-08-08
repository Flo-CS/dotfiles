#!/usr/bin/env bash

set -euo pipefail # Exit on error, undefined variable, or failed command in a pipeline

. ./bin/dots/utils.sh

OPTIONS=("install" "set theme" "set wallpaper" "list themes" "list wallpapers")

selected_option=$(gum choose --header "What to do ?" "${OPTIONS[@]}")
case "$selected_option" in
"install")
	. ./bin/dots/install.sh
	;;
"set theme")
	. ./bin/dots/theme.sh set
	;;
"set wallpaper")
	. ./bin/dots/wallpaper.sh set
	;;
"list themes")
	. ./bin/dots/theme.sh list
	;;
"list wallpapers")
	. ./bin/dots/wallpaper.sh list
	;;
esac
