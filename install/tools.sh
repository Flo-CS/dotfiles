#!/usr/bin/env bash

source $DOTFILES_UTILS

# terminal
install_packages alacritty
install_packages starship

# files-handling
install_packages bat
install_packages fd ripgrep fzf
install_packages zoxide
install_packages jq go-yq

# system-monitoring
install_packages fastfetch
install_packages btop

# system-controls
install_packages brightnessctl playerctl
install_packages power-profiles-daemon
yay -S bluetuith

# disk
install_packages gvfs udisks2

# man-pages
install_packages man-pages
install_packages tldr
