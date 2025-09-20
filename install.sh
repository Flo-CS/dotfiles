#!/usr/bin/env bash

show_section() {
	gum style --border double " $1 "
}

export MYARCHY_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
export PATH=$MYARCHY_DIR/bin:$PATH

show_section "Installation of base packages"
$MYARCHY_DIR/install/install-base

show_section "Deployment of system wide binaries"
$MYARCHY_DIR/install/deploy-system-bins

show_section "Configuration of myarchy"
source $MYARCHY_DIR/install/configure-myarchy

show_section "Update of system packages"
sudo pacman -Syu --noconfirm

show_section "Installation of additional packages"
$MYARCHY_DIR/install/install-additional

show_section "Installation of development packages"
$MYARCHY_DIR/install/install-dev

show_section "Setup of system backups"
$MYARCHY_DIR/install/setup-system-backups

show_section "Setup of grub"
$MYARCHY_DIR/install/setup-grub

show_section "Updating sudoers configuration"
$MYARCHY_DIR/install/configure-sudoers

show_section "Deployment of user files (config, applications, ...)"
$MYARCHY_DIR/install/deploy-user-files

show_section "Installation complete !"
gum confirm "Do you want to reboot now? It may be absolutely necessary for some programs to work correctly" && {
	sudo reboot
}
