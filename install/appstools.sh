#!/usr/bin/env bash

source $DOTFILES_UTILS

section "Terminal"
install_packages alacritty
install_packages starship

section "Files Handling"
install_packages bat
install_packages fd ripgrep fzf
install_packages zoxide
install_packages jq go-yq

section "System Monitoring"
install_packages fastfetch
install_packages btop

section "System Controls"
install_packages brightnessctl playerctl
install_packages power-profiles-daemon
install_yay_packages bluetuith

section "Disk"
install_packages gvfs udisks2 udiskie

section "Man Pages"
install_packages man-pages
install_packages tldr

section "File Manager"
install_packages thunar

section "Sync"
install_packages rclone syncthing rsync
