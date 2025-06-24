#!/usr/bin/env bash

source $DOTFILES_UTILS

section "Hyprland"
install_packages hyprland hyprpaper hyprcursor hyprlock hypridle hyprland-qtutils hyprland-qt-support hyprpolkitagent
install_packages xdg-desktop-portal-hyprland xdg-desktop-portal-gtk
install_packages qt6-wayland qt5-wayland

section "Hyprland Plugins"
install_packages cmake meson cpio git gcc

section "Uwsm"
install_packages uwsm libnewt

section "Waybar"
install_packages waybar
install_packages upower

section "Customization"
install_packages kvantum kvantum-qt5 # QT
install_packages nwg-look            # GTK

section "Notifications"
install_packages swaync

section "Launcher"
install_packages wofi

section "Clipboard"
install_packages wl-clipboard

section "Fonts"
install_packages ttf-jetbrains-mono-nerd ttf-nerd-fonts-symbols

section "Quickshell"
install_packages qt6-shadertools cli11
if ! sudo test -e ~/documents/quickshell; then
	git clone https://github.com/Flo-CS/quickshell.git ~/documents/quickshell
fi
# TODO: Why sudo is required? How to install as user?
cd ~/documents/quickshell && git pull && cmake -GNinja -B build -DCMAKE_BUILD_TYPE=ReleaseWithDebInfo -DCRASH_REPORTER=OFF &&
	cmake --build build &&
	sudo cmake --install build
