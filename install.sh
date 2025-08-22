#!/usr/bin/env bash

# BASH CONFIG

set -euo pipefail

# UTILS

show_section() {
	gum style --border double " $1 "
}

# STARTUP

DOTS_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
$DOTS_DIR/bin.sh

# SEQUENCE

dots-show-logo

show_section "Checking and setting up environment"
. dots-init-env
dots-init-theme
dots-init-wallpaper

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
