#!/usr/bin/env bash

source $DOTFILES_UTILS

# hypr
mkdir -p ~/.config/hypr

# hyprland
create_dotfiles_symlink hypr/hyprland ~/.config/hypr/hyprland
create_dotfiles_symlink hypr/hyprland-themes/$HYPRLAND_THEME_NAME.conf ~/.config/hypr/hyprland-themes/main-theme.conf
create_dotfiles_symlink hypr/hyprland.conf ~/.config/hypr/hyprland.conf
touch ~/.config/hypr/hyprland/custom.conf
hyprctl reload

# hypridle
create_dotfiles_symlink hypr/hypridle.conf ~/.config/hypr/hypridle.conf

# hyprpaper
create_dotfiles_symlink hypr/hyprpaper.conf ~/.config/hypr/hyprpaper.conf

# hyprcursor
create_dotfiles_symlink hypr/hyprlock.conf ~/.config/hypr/hyprlock.conf
create_dotfiles_symlink hypr/hyprlock ~/.config/hypr/hyprlock

# hyprland-plugins
# TODO: Check why hyprpm ask the sudo password
read -p "Enter the version of hyprland-plugins (e.g. v0.48.0): " plugins_version
hyprpm add https://github.com/hyprwm/hyprland-plugins $plugins_version
hyprpm enable hyprexpo

# waybar
mkdir -p ~/.config/waybar
create_dotfiles_symlink waybar/config.jsonc ~/.config/waybar/config.jsonc
create_dotfiles_symlink waybar/style.css ~/.config/waybar/style.css
create_dotfiles_symlink waybar/themes/$WAYBAR_THEME_NAME.css ~/.config/waybar/main-theme.css

# kvantum
mkdir -p ~/.config/Kvantum
create_dotfiles_recursive_copy kvantum/themes/. ~/.config/Kvantum
create_dotfiles_symlink kvantum/kvantum.kvconfig ~/.config/Kvantum/kvantum.kvconfig
insert_content_with_marker ~/.config/Kvantum/kvantum.kvconfig "theme" "theme=$KVANTUM_THEME_NAME"

# swaync
create_dotfiles_symlink swaync ~/.config/swaync

# wofi
mkdir -p ~/.config/wofi/config

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
