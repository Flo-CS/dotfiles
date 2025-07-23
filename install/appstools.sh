#!/usr/bin/env bash

source $DOTFILES_UTILS

section "Terminal"
install_packages alacritty
uninstall_packages xterm
sudo ln -s /usr/bin/alacritty /usr/bin/xterm # Stupid workaround to allow to run .desktop files that require by default xterm (i don't know how to change it)

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
install_packages thunar yazi ranger nnn

section "Sync"
install_packages rclone syncthing rsync

section "Transfers"
install_packages kdeconnect localsend
