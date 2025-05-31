
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
sudo zypper install sof-firmware

# Bashrc and Profile
create_symlink ~/dotfiles/shell/.bashrc ~/.bashrc-default
if ! grep -q "source ~/.bashrc-default" ~/.bashrc; then
  echo "source ~/.bashrc-default" >> ~/.bashrc
fi
create_symlink ~/dotfiles/shell/.profile ~/.profile-default
if ! grep -q "source ~/.profile-default" ~/.profile; then
  echo "source ~/.profile-default" >> ~/.profile
fi

# General
# sudo zypper install eza
# mkdir -p ~/.config/eza
# ln -sT ~/dotfiles/eza/rose-pine.yml  ~/.config/eza/theme.yml

sudo zypper install bat
mkdir -p "$(bat --config-dir)"
create_symlink ~/dotfiles/bat "$(bat --config-dir)"
bat cache --build

sudo zypper install fd

# Hyprland
sudo zypper install hyprland hyprpaper hyprcursor hyprlock hypridle hyprland-qtutils hyprland-qt-support
read -p "Do you want to install the Hyprland plugins ? (y/n): " install_hyprland_devel
if [[ $install_hyprland_devel == "y" ]]; then
  # TODO: perhaps use the e.g. pkgconfig(pixman-1) syntax
  sudo zypper install cpio cmake git meson gcc gcc-c++
  sudo zypper install hyprland-devel hyprland-protocols-devel
  sudo zypper install libpixman-1-0-devel libdrm-devel pango-devel libinput-devel wayland-devel wayland-protocols-devel libxkbcommon-devel systemd-devel Mesa-libGLESv2-devel Mesa-libGLESv3-devel hyprlang-devel hyprutils-devel hyprgraphics-devel aquamarine-devel xcb-util-wm-devel
  read -p "Enter the version of hyprland-plugins (e.g. v0.48.0): " plugins_version
  hyprpm add https://github.com/hyprwm/hyprland-plugins $plugins_version
  hyprpm enable hyprexpo
fi
sudo zypper install xdg-desktop-portal-hyprland xdg-desktop-portal-gtk
sudo zypper in qt6-wayland libqt5-qtwayland
touch ~/.config/hypr/hyprland/custom.conf
create_symlink ~/dotfiles/hypr ~/.config/hypr

# System controls
sudo zypper in playerctl brightnessctl
sudo zypper in power-profiles-daemon
sudo zypper in bluetoothctl bluetuith

# Waybar
sudo zypper install --no-recommends waybar
## Recommended
sudo zypper install upower
create_symlink ~/dotfiles/waybar ~/.config/waybar

# Kvantum
sudo zypper install kvantum-manager kvantum-qt5 kvantum-qt6
create_symlink ~/dotfiles/kvantum ~/.config/Kvantum

# Gtk look
sudo zypper install nwg-look

# Wlogout
sudo zypper install wlogout
create_symlink ~/dotfiles/wlogout ~/.config/wlogout

# Swaync
sudo zypper install SwayNotificationCenter
create_symlink ~/dotfiles/swaync ~/.config/swaync

# Wofi
sudo zypper install wofi
create_symlink ~/dotfiles/wofi ~/.config/wofi
create_symlink ~/dotfiles/bin/wofi-emoji ~/.local/bin/wofi-emoji

# Alacritty
sudo zypper install alacritty
create_symlink ~/dotfiles/alacritty ~/.config/alacritty

# Starship
sudo zypper install starship
create_symlink ~/dotfiles/starship/starship.toml ~/.config/starship.toml

# Icons
create_symlink ~/dotfiles/icons ~/.local/share/icons

# NodeJS
##
## Manually install nvm: https://github.com/nvm-sh/nvm
##
read -p "Press enter when nvm is installed"
nvm install --lts

# TLDR
npm install -g tldr

# Zig
sudo zypper install --no-recommends zig

# Fonts
##
## - JetBrains Mono Nerd Font
## - Symbols Nerd Font
## - Rubik
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
create_symlink ~/dotfiles/nvim ~/.config/nvim

# Neovide
sudo zypper install neovide

# Ripgrep
sudo zypper install ripgrep

# Fzf
sudo zypper install fzf
mkdir -p ~/.local/bin/fzf
create_symlink ~/dotfiles/fzf/rose-pine.sh ~/.local/bin/fzf/rose-pine.sh

# Btop
sudo zypper install btop
create_symlink ~/dotfiles/btop/btop.conf ~/.config/btop/btop.conf
create_symlink ~/dotfiles/btop/themes ~/.config/btop/themes

# Neofetch/Fastfetch
sudo zypper install fastfetch

# Git
create_symlink ~/dotfiles/gitconfig/linux/.gitconfig ~/.gitconfig-default
if ! grep -q "~/.gitconfig-default" ~/.gitconfig; then
  echo "[include]" >> ~/.gitconfig
  echo "	path = ~/.gitconfig-default" >> ~/.gitconfig
fi
sudo zypper install git-filter-repo

# Nvidia
read -p "Do you want to install the NVIDIA drivers? (y/n): " install_nvidia
if [[ $install_nvidia == "y" ]]; then
  sudo zypper install openSUSE-repos-Tumbleweed-NVIDIA
  sudo zypper install-new-recommends --repo repo-non-free
  sudo zypper install --auto-agree-with-licenses nvidia-video-G06 nvidia-gl-G06 nvidia-compute-G06 nvidia-compute-utils-G06
fi

# Remove SDDM
read -p "Do you want to remove SDDM? (y/n): " remove_sddm
if [[ $remove_sddm == "y" ]]; then
  sudo zypper remove sddm
  sudo systemctl set-default multi-user.target
fi

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

# Uninstall unnecessary packages
read -p "Do you want to uninstall xterm and related packages? (y/n): " uninstall_packages
if [[ $uninstall_packages == "y" ]]; then
  sudo zypper remove xterm xterm-bin xtermset xterm-resize
fi

