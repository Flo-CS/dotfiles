#!/usr/bin/env bash

DOTS_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
set -euo pipefail

trap 'printf "Installation failed, please retry\n"' ERR
trap 'printf "Exiting...\n"' EXIT

show_section() {
	gum style --border double " $1 "
}

show_section "Checking and setting up environment"
$DOTS_DIR/bin.sh
. dots-env-check-set
dots-theme-init
dots-wallpaper-init

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
gum confirm "Do you want to reboot now?" && {
	sudo reboot
}
