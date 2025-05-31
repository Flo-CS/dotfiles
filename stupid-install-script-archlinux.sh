#!/usr/bin/env bash

# Function to create a symbolic link but ask for backup if it already exists
create_symlink() {
	local target="$1"
	local link_name="$2"

	if [ -e "$link_name" ]; then
		read -p "File $link_name already exists. Do you want to backup it? (y/n): " backup_choice
		if [[ $backup_choice == "y" ]]; then
			mv "$link_name" "${link_name}.bak"
			echo "Backup created: ${link_name}.bak"
		else
			echo "Skipping creation of symlink for $link_name."
			return
		fi
	fi

	ln -sT "$target" "$link_name"
	echo "Created symlink: $link_name -> $target"
}

# System
sudo cp ~/dotfiles/system/sudoers/florian /etc/sudoers.d/florian

# Audio
sudo pacman -S sof-firmware pipewire wireplumbler pipewire-audio pipewire-pulse pipewire-jack

# Bashrc and Profile
create_symlink ~/dotfiles/shell/.bashrc ~/.bashrc-default
if ! grep -q "source ~/.bashrc-default" ~/.bashrc; then
  echo "source ~/.bashrc-default" >> ~/.bashrc
fi
create_symlink ~/dotfiles/shell/.profile ~/.profile-default
if ! grep -q "source ~/.profile-default" ~/.profile; then
  echo "source ~/.profile-default" >> ~/.profile
fi

# Bat
sudo pacman -S bat
mkdir -p "$(bat --config-dir)"
create_symlink ~/dotfiles/bat "$(bat --config-dir)"
bat cache --build

sudo pacman -S fd

sudo pacman -S man-pages

# Hyprland
sudo pacman -S hyprland hyprpaper hyprcursor hyprlock hypridle hyprland-qtutils hyprland-qt-support
read -p "Do you want to install the Hyprland plugins? (y/n): " install_plugins
if [[ $install_plugins == "y" ]]; then
  # TODO: Check why hyprpm ask the sudo password
  sudo pacman -S cmake meson cpio git gcc
  read -p "Enter the version of hyprland-plugins (e.g. v0.48.0): " plugins_version
  hyprpm add https://github.com/hyprwm/hyprland-plugins $plugins_version
  hyprpm enable hyprexpo
fi
sudo pacman -S xdg-desktop-portal-hyprland xdg-desktop-portal-gtk
sudo pacman -S qt6-wayland
touch ~/.config/hypr/hyprland/custom.conf
create_symlink ~/dotfiles/hypr ~/.config/hypr

# System controls
sudo pacman -S brightnessctl playerctl
sudo pacman -S power-profiles-daemon
yay -S bluetuith

# Waybar
sudo pacman -S waybar
sudo pacman -S upower
create_symlink ~/dotfiles/waybar ~/.config/waybar

# Kvantum
sudo pacman -S kvantum kvantum-qt5
create_symlink ~/dotfiles/kvantum ~/.config/Kvantum

# Gtk look
sudo pacman -S nwg-look

# Swaync
sudo pacman -S swaync
create_symlink ~/dotfiles/swaync ~/.config/swaync

# Wofi
sudo pacman -S wofi
create_symlink ~/dotfiles/wofi ~/.config/wofi

# Alacritty
sudo pacman -S alacritty
create_symlink ~/dotfiles/alacritty ~/.config/alacritty

# Starship
sudo pacman -S starship
create_symlink ~/dotfiles/starship/starship.toml ~/.config/starship.toml

# Icons
create_symlink ~/dotfiles/icons ~/.local/share/icons

# NodeJS
sudo pacman -S nvm
source ~/.bashrc
nvm install --lts

# TLDR
sudo pacman -S tldr

# Fonts
sudo pacman -S ttf-jetbrains-mono-nerd ttf-nerd-fonts-symbols

# Neovim
sudo pacman -S neovim
sudo pacman -S wl-clipboard
create_symlink ~/dotfiles/nvim ~/.config/nvim

# Ripgrep
sudo pacman -S ripgrep

# Fzf
sudo pacman -S fzf
mkdir -p ~/.local/bin/fzf
create_symlink ~/dotfiles/fzf/rose-pine.sh ~/.local/bin/fzf/rose-pine.sh

# Btop
sudo pacman -S btop
mkdir -p ~/.config/btop
create_symlink ~/dotfiles/btop/btop.conf ~/.config/btop/btop.conf
create_symlink ~/dotfiles/btop/themes ~/.config/btop/themes

# Fastfetch
sudo pacman -S fastfetch

# Git
create_symlink ~/dotfiles/gitconfig/linux/.gitconfig ~/.gitconfig-default
if ! grep -q "~/.gitconfig-default" ~/.gitconfig; then
  echo "[include]" >> ~/.gitconfig
  echo "	path = ~/.gitconfig-default" >> ~/.gitconfig
fi
sudo pacman -S git-filter-repo

# Hyprland autostart
read -p "Do you want to set Hyprland as default? (y/n): " set_hyprland
if [[ $set_hyprland == "y" ]]; then
  if ! grep -q "# Hyprland autostart" ~/.profile; then
    echo "# Hyprland autostart" >> ~/.profile
    echo "if [ -z \"\$DISPLAY\" ] && [ \"\$(tty)\" = \"/dev/tty1\" ]; then" >> ~/.profile
    echo "  exec Hyprland" >> ~/.profile
    echo "fi" >> ~/.profile
  fi
fi
