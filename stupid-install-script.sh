#!/usr/bin/env bash

# System
sudo cp ~/dotfiles/system/sudoers/florian /etc/sudoers.d/florian



# Audio
sudo zypper install sof-firmware



# Bashrc and Profile
ln -sT ~/dotfiles/shell/opensuse/.bashrc ~/.bashrc-default
if ! grep -q "source ~/.bashrc-default" ~/.bashrc; then
  echo "source ~/.bashrc-default" >> ~/.bashrc
fi
ln -sT ~/dotfiles/shell/opensuse/.profile ~/.profile-default
if ! grep -q "source ~/.profile-default" ~/.profile; then
  echo "source ~/.profile-default" >> ~/.profile
fi



# Hyprland
sudo zypper install cpio cmake git meson gcc gcc-c++
sudo zypper install hyprland-devel hyprland-protocols-devel
sudo zypper install hyprland hyprpaper hyprcursor hyprlock hypridle hyprland-qtutils hyprland-qt-support
## TODO: perhaps use the e.g. pkgconfig(pixman-1) syntax
sudo zypper install libpixman-1-0-devel libdrm-devel pango-devel libinput-devel wayland-devel wayland-protocols-devel libxkbcommon-devel systemd-devel Mesa-libGLESv2-devel Mesa-libGLESv3-devel hyprlang-devel hyprutils-devel hyprgraphics-devel aquamarine-devel xcb-util-wm-devel
## Ask plugins version 
read -p "Enter the version of hyprland-plugins (e.g. v0.48.0): " plugins_version
hyprpm add https://github.com/hyprwm/hyprland-plugins $plugins_version
ln -sT ~/dotfiles/hypr ~/.config/hypr
sudo zypper install xdg-desktop-portal-hyprland xdg-desktop-portal-gtk
sudo zypper in qt6-wayland libqt5-qtwayland




# System controls
sudo zypper in playerctl brightnessctl



# Waybar
sudo zypper install --no-recommends waybar
## Recommended
sudo zypper install upower
ln -sT ~/dotfiles/waybar ~/.config/waybar



# Kvantum
sudo zypper install kvantum-manager kvantum-qt5 kvantum-qt6
ln -sT ~/dotfiles/kvantum ~/.config/Kvantum




# Gtk look
sudo zypper install nwg-look




# Wlogout
sudo zypper install wlogout
ln -sT ~/dotfiles/wlogout ~/.config/wlogout



# Swaync
sudo zypper install SwayNotificationCenter
ln -sT ~/dotfiles/swaync ~/.config/swaync



# Wofi
sudo zypper install wofi
ln -sT ~/dotfiles/wofi ~/.config/wofi
ln -sT ~/dotfiles/wofi-emoji ~/.local/bin/wofi-emoji


# Alacritty
sudo zypper install alacritty
ln -sT ~/dotfiles/alacritty ~/.config/alacritty



# Starship
sudo zypper install starship
ln -sT ~/dotfiles/starship/starship.toml ~/.config/starship.toml



# Icons
ln -sT ~/dotfiles/icons ~/.local/share/icons


# NodeJS
##
## Manually install nvm: https://github.com/nvm-sh/nvm
##
read -p "Press enter when nvm is installed"
nvm install --lts



# Zig
sudo zypper install --no-recommends zig



# Fonts
##
## Manually download from NerdFonts: https://www.nerdfonts.com/font-downloads
## unzip XXX.zip -d XXX
## cp -r XXX /usr/share/fonts/
##
read -p "Press enter when the fonts are installed"



# Neovim
sudo zypper install --no-recommends neovim
## Recommended
sudo zypper install inotify-tools wl-clipboard
## Config symlink
ln -sT ~/dotfiles/nvim ~/.config/nvim



# Neovide
sudo zypper install neovide


# Ripgrep
sudo zypper install ripgrep



# Fzf
sudo zypper install fzf
mkdir -p ~/.local/bin/fzf
ln -sT ~/dotfiles/fzf/rose-pine.sh ~/.local/bin/fzf/rose-pine.sh



# Btop
sudo zypper install btop
ln -sT ~/dotfiles/btop/btop.conf ~/.config/btop/btop.conf
ln -sT ~/dotfiles/btop/themes ~/.config/btop/themes



# Neofetch/Fastfetch
sudo zypper install fastfetch



# Git
ln -sT ~/dotfiles/gitconfig/opensuse/.gitconfig ~/.gitconfig-default
if ! grep -q "~/.gitconfig-default" ~/.gitconfig; then
  echo "[include]" >> ~/.gitconfig
  echo "	path = ~/.gitconfig-default" >> ~/.gitconfig
fi



# Nvidia
sudo zypper install openSUSE-repos-Tumbleweed-NVIDIA
sudo zypper install-new-recommends --repo repo-non-free
sudo zypper install --auto-agree-with-licenses nvidia-video-G06 nvidia-gl-G06 nvidia-compute-G06 nvidia-compute-utils-G06

