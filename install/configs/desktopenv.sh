#!/usr/bin/env bash

source $DOTFILES_UTILS

# hyprland
create_dotfiles_symlink hypr ~/.config/hypr
touch ~/.config/hypr/hyprland/custom.conf

# hyprland-plugins
# TODO: Check why hyprpm ask the sudo password
read -p "Enter the version of hyprland-plugins (e.g. v0.48.0): " plugins_version
hyprpm add https://github.com/hyprwm/hyprland-plugins $plugins_version
hyprpm enable hyprexpo

# waybar
create_dotfiles_symlink waybar ~/.config/waybar

# customization
create_dotfiles_symlink kvantum ~/.config/Kvantum

# notifications
create_dotfiles_symlink swaync ~/.config/swaync

# launcher
mkdir ~/.config/wofi/config
create_dotfiles_symlink wofi/config ~/.config/wofi/config
create_dotfiles_copy wofi/style.css ~/.config/wofi/style.css
insert_content_with_marker ~/.config/wofi/style.css "theme" "$(cat $DOTFILES_DIR/files/wofi/themes/rose-pine.css)" "/*" "*/"

# icons
create_dotfiles_recursive_copy icons/. ~/.local/share/icons

# hyprland-autostart
insert_content_with_marker ~/.bash_profile "hyprland-autostart" "if uwsm check may-start; then 
	exec uwsm start hyprland.desktop
fi"

# quickshell
create_dotfiles_symlink quickshell ~/.config/quickshell
