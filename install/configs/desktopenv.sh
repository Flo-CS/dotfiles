#!/usr/bin/env bash

source $DOTFILES_UTILS

section "Hyprland"
mkdir -p ~/.config/hypr
create_dotfiles_symlink hypr/hyprland/custom-$DOTFILES_DEVICE_NAME.conf ~/.config/hypr/hyprland/custom.conf
create_dotfiles_symlink hypr/hyprland/keybinds.conf ~/.config/hypr/hyprland/keybinds.conf
create_dotfiles_symlink hypr/hyprland/rules.conf ~/.config/hypr/hyprland/rules.conf
create_dotfiles_symlink hypr/hyprland/exec.conf ~/.config/hypr/hyprland/exec.conf
create_dotfiles_symlink hypr/hyprland/env.conf ~/.config/hypr/hyprland/env.conf
create_dotfiles_symlink hypr/hyprland-themes/$HYPRLAND_THEME_NAME.conf ~/.config/hypr/hyprland-themes/main-theme.conf
create_dotfiles_symlink hypr/hyprland.conf ~/.config/hypr/hyprland.conf
hyprctl reload

section "Hypridle"
create_dotfiles_symlink hypr/hypridle.conf ~/.config/hypr/hypridle.conf

section "Hyprpaper"
create_dotfiles_symlink hypr/hyprpaper.conf ~/.config/hypr/hyprpaper.conf

section "Hyprlock"
create_dotfiles_symlink hypr/hyprlock.conf ~/.config/hypr/hyprlock.conf
create_dotfiles_symlink hypr/hyprlock ~/.config/hypr/hyprlock

section "Hyprland Plugins"
read -p "Enter the version of hyprland-plugins (e.g. v0.48.0): " plugins_version
if test -z "$plugins_version"; then
	echo "No version provided, cannot install hyprland-plugins"
else
	hyprpm update
	hyprpm add https://github.com/hyprwm/hyprland-plugins $plugins_version
	hyprpm enable hyprexpo
fi

section "Waybar"
mkdir -p ~/.config/waybar
create_dotfiles_symlink waybar/config.jsonc ~/.config/waybar/config.jsonc
create_dotfiles_symlink waybar/style.css ~/.config/waybar/style.css
create_dotfiles_symlink waybar/themes/$WAYBAR_THEME_NAME.css ~/.config/waybar/main-theme.css

section "Swaync"
mkdir -p ~/.config/swaync
create_dotfiles_copy swaync/style.css ~/.config/swaync/style.css
create_dotfiles_symlink swaync/config.json ~/.config/swaync/config.json
insert_content_with_marker ~/.config/swaync/style.css "theme" "$(cat $DOTFILES_DIR/files/swaync/themes/$SWAYNC_THEME_NAME.css)" "/*" "*/"

section "Wofi"
mkdir -p ~/.config/wofi/config
create_dotfiles_symlink wofi/config ~/.config/wofi/config
create_dotfiles_copy wofi/style.css ~/.config/wofi/style.css
insert_content_with_marker ~/.config/wofi/style.css "theme" "$(cat $DOTFILES_DIR/files/wofi/themes/rose-pine.css)" "/*" "*/"

section "Wofi menus"
create_dotfiles_symlink bin/wofi-emoji ~/.local/bin/wofi-emoji

section "Hyprland Autostart"
insert_content_with_marker ~/.bash_profile "hyprland-autostart" "if uwsm check may-start; then 
	exec uwsm start hyprland.desktop
fi"

section "Quickshell"
create_dotfiles_symlink quickshell ~/.config/quickshell
