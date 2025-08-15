#!/usr/bin/env bash

. $DOTS_DIR/bin/dots/utils.sh

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

main() {
	local command="$1"
	case "$command" in
	list)
		list_themes
		;;
	set)
		local theme="${2:-$(select_theme)}"
		set_theme "$theme"
		;;
	esac
}

main "$@"
