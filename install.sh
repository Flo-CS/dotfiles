#!/usr/bin/env bash

set -euo pipefail

show_section() {
	gum style --border double " $1 "
}

DOTS_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
$DOTS_DIR/install/init/bin
dots-show-logo

show_section "Checking and setting up environment"
sudo pacman -S --noconfirm gum
source $DOTS_DIR/install/init/env
$DOTS_DIR/install/init/theme
$DOTS_DIR/install/init/wallpaper

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
dots-deploy-config
dots-deploy-applications

show_section "Finalizing installation"
gum confirm "Do you want to reboot now? It may be absolutely necessary for some programs to work correctly" && {
	sudo reboot
}
