#!/usr/bin/env bash

DOTS_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

set -euo pipefail

on_error() {
	printf "Installation failed, please retry"
}
trap on_error ERR

on_exit() {
	printf '\nExiting...\n'
}
trap on_exit EXIT

show_art() {
	art=''
	clear
	printf "\n$art\n"
}

show_section() {
	gum style --border double " $1 "
}

show_section "Checking and setting up environment"
$DOTS_DIR/bin/dots-env-check-set
$DOTS_DIR/bin/dots-theme-init
$DOTS_DIR/bin/dots-wallpaper-init

show_section "Installing prerequisites [1/6]"
$DOTS_DIR/install/prerequesites

show_section "Updating system packages [2/6]"
sudo pacman -Syu --noconfirm

show_section "Configuring and installing system essentials [3/6]"
$DOTS_DIR/install/system

show_section "Installing development tools [4/6]"
$DOTS_DIR/install/dev

show_section "Installing desktop environment and applications [5/6]"
$DOTS_DIR/install/desktop

show_section "Applying configurations [6/6]"
$DOTS_DIR/config.sh

show_section "Finalizing installation"
should_reboot=$(gum confirm "Do you want to reboot now?")
if [[ "$should_reboot" == "true" ]]; then
	sudo reboot
fi
