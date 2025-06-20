#!/usr/bin/env bash

source $DOTFILES_UTILS

# hyprland
install_packages hyprland hyprpaper hyprcursor hyprlock hypridle hyprland-qtutils hyprland-qt-support hyprpolkitagent
install_packages xdg-desktop-portal-hyprland xdg-desktop-portal-gtk
install_packages qt6-wayland qt5-wayland

# hyprland-plugins
install_packages cmake meson cpio git gcc

# uwsm
install_packages uwsm libnewt

# waybar
install_packages waybar
install_packages upower

# customization
install_packages kvantum kvantum-qt5 # QT
install_packages nwg-look            # GTK

# notifications
install_packages swaync

# launcher
install_packages wofi

# clipboard
install_packages wl-clipboard

# fonts
install_packages ttf-jetbrains-mono-nerd ttf-nerd-fonts-symbols

# quickshell
# # TODO: Why sudo is required? How to install as user?
install_packages qt6-shadertools cli11
git clone https://github.com/Flo-CS/quickshell.git ~/documents/quickshell
cd ~/documents/quickshell
cmake -GNinja -B build -DCMAKE_BUILD_TYPE=ReleaseWithDebInfo -DCRASH_REPORTER=OFF &&
	cmake --build build &&
	sudo cmake --install build
