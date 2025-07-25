#!/usr/bin/env bash

set -euo pipefail # Exit on error, undefined variable, or failed command in a pipeline

if [[ -z "$DOTFILES_DIR" ]]; then
	echo "DOTFILES_DIR is not set. Please set it to the path of your dotfiles directory."
	exit 1
fi

if [[ -z "$DOTFILES_ID" ]]; then
	echo "DOTFILES_ID is not set. Please set it to the path of your dotfiles directory."
	exit 1
fi

source "$DOTFILES_DIR/.dotsutils.sh" || exit 1

install() {
	install_files=$(fd .sh $DOTFILES_DIR/install)
	selected_install_files=$(gum filter --no-limit --header "What to install ?" $install_files)
	for f in $selected_install_files; do
		source $f
	done

	sudo snapper -c root create --description "After system setup" -u important=yes
}

main() {
	local options=("install")

	local selected_option=$(gum choose --header "What to do ?" "${options[@]}")

	case $selected_option in
	install)
		install
		;;
	esac
}

main
