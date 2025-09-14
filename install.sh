#!/usr/bin/env bash

set -euo pipefail

show_section() {
	gum style --border double " $1 "
}

echo "Installation of essential packages for the install script"
sudo pacman -S --noconfirm python-j2cli gum glow

export MYARCHY_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
export PATH=$MYARCHY_DIR/bin:$PATH

show_section "Deployment of system wide binaries"
$MYARCHY_DIR/install/deploy-system-bins

show_section "Configuration of myarchy"
source $MYARCHY_DIR/install/prompt-and-save-myarchy-settings

show_section "Update of system packages"
sudo pacman -Syu --noconfirm

show_section "Installation of common packages"
$MYARCHY_DIR/install/install-common

show_section "Installation of desktop packages"
$MYARCHY_DIR/install/install-desktop

show_section "Installation of development packages"
$MYARCHY_DIR/install/install-dev

show_section "Setup of system backups"
$MYARCHY_DIR/install/setup-system-backups

show_section "Setup of grub alternatives boot entries"
$MYARCHY_DIR/install/setup-grub-boot-alternatives

show_section "Updating sudoers configuration"
$MYARCHY_DIR/install/configure-sudoers

show_section "Deployment of user files (config, applications, ...)"
$MYARCHY_DIR/install/deploy-user-files

show_section "Installation complete !"
gum confirm "Do you want to reboot now? It may be absolutely necessary for some programs to work correctly" && {
	sudo reboot
}
