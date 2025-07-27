#!/usr/bin/env bash

set -euo pipefail # Exit on error, undefined variable, or failed command in a pipeline

. ./.dotsenv.sh

OPTIONS=("install" "set theme" "set wallpaper" "list themes" "list wallpapers")

selected_option=$(gum choose --header "What to do ?" "${OPTIONS[@]}")
case "$selected_option" in
"install")
	. ./.dotsinstall.sh
	;;
"set theme")
	. ./.dotstheme.sh set
	;;
"set wallpaper")
	. ./.dotswallpaper.sh set
	;;
"list themes")
	. ./.dotstheme.sh list
	;;
"list wallpapers")
	. ./.dotswallpaper.sh list
	;;
esac
