#!/usr/bin/env bash

set -euo pipefail # Exit on error, undefined variable, or failed command in a pipeline

if [[ -z "$DOTS_DIR" ]]; then
	export DOTS_DIR=$(gum input --placeholder "Enter the path to your dotfiles directory" --value "$HOME/.dotfiles")
fi

if [[ -z "$DOTS_ID" ]]; then
	export DOTS_ID=$(gum input --placeholder "Enter your dots ID for machine specific files (e.g.: jean.desktop)" --value "$(basename "$DOTS_DIR")")
fi

main() {
	local command="$1"
	shift
	case "$command" in
	install)
		. $DOTS_DIR/bin/dots/install.sh "$@"
		;;
	theme)
		. $DOTS_DIR/bin/dots/theme.sh "$@"
		;;
	wallpaper)
		. $DOTS_DIR/bin/dots/wallpaper.sh "$@"
		;;
	backup)
		. $DOTS_DIR/bin/dots/backup.sh "$@"
		;;
	esac
}

main "$@"
