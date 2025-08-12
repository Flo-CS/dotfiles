#!/usr/bin/env bash

THEMES_PATH="$DOTS_DIR/config/theme"

set_theme() {
	ln -sfT $THEMES_PATH/$1 $THEMES_PATH/current
}

list_themes() {
	find "$THEMES_PATH" -mindepth 1 -maxdepth 1 -type d ! -lname '*' -printf '%f\n'
}

select_theme() {
	gum choose --header "Select a theme" $(list_themes)
}

case "$1" in
list)
	list_themes
	;;
set)
	set_theme ${2:-$(select_theme)}
	;;
esac
