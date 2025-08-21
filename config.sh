#!/usr/bin/env bash

set -euo pipefail

configure_shell() {
	dots-file-link config/.bashrc ~/.bashrc
	dots-file-link config/.bash_profile ~/.bash_profile
}

configure_uwsm() {
	dots-file-link config/uwsm ~/.config/uwsm
}

configure_git() {
	dots-file-link config/.gitconfig ~/.gitconfig
}

configure_bat() {
	local bat_dir="$(bat --config-dir)"
	dots-file-link config/bat "${bat_dir}/config"
	dots-file-link themes/current/bat.tmTheme "${bat_dir}/themes/current.tmTheme"
	bat cache --build || echo "bat cache build failed" >&2
}

configure_cursor() {
	dots-file-link themes/current/cursor-icons ~/.local/share/icons/cursor
}

configure_hyprland() {
	dots-file-link config/hypr/hyprland.conf ~/.config/hypr/hyprland.conf
	dots-file-link config/hypr/hyprlock.conf ~/.config/hypr/hyprlock.conf
	dots-file-link config/hypr/hypridle.conf ~/.config/hypr/hypridle.conf
	dots-file-link config/hypr/hyprpaper.conf ~/.config/hypr/hyprpaper.conf
}

configure_monitoring() {
	dots-file-link config/btop.conf ~/.config/btop/btop.conf
	dots-file-link themes/current/btop.theme ~/.config/btop/current.theme
}

configure_qt() {
	dots-file-link config/kvantum.kvconfig ~/.config/Kvantum/kvantum.kvconfig
	dots-file-link themes/current/kvantum ~/.config/Kvantum/current-theme
}

configure_quickshell() {
	dots-file-link config/quickshell ~/.config/quickshell
}

configure_swaync() {
	dots-file-link config/swaync.json ~/.config/swaync/config.json
	dots-file-link themes/current/swaync.css ~/.config/swaync/style.css
}

configure_waybar() {
	dots-file-link config/waybar.jsonc ~/.config/waybar/config.jsonc
	dots-file-link themes/current/waybar.css ~/.config/waybar/style.css
}

configure_wofi() {
	dots-file-link config/wofi ~/.config/wofi/config
	dots-file-link themes/current/wofi.css ~/.config/wofi/style.css
}

configure_neovim() {
	dots-file-link config/nvim ~/.config/nvim
	dots-file-link themes/current/nvim.theme ~/.config/nvim/.theme
}

configure_terminal() {
	dots-file-link config/atuin.toml ~/.config/atuin/config.toml
	dots-file-link config/alacritty.toml ~/.config/alacritty/alacritty.toml
	dots-file-link themes/current/alacritty.toml ~/.config/alacritty/current-theme.toml
	dots-file-template config/starship.toml.j2
	dots-file-link config/starship.toml ~/.config/starship.toml
}

configure_privileged() {
	sudo -E dots-file-copy config/sudoers /etc/sudoers.d/sudoers-default
}

configure_xdg() {
	dots-file-link config/user-dirs.dirs ~/.config/user-dirs.dirs
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
	dots-env-check-set

	configure_shell
	configure_git
	configure_bat
	configure_cursor
	configure_hyprland
	configure_monitoring
	configure_qt
	configure_quickshell
	configure_swaync
	configure_waybar
	configure_wofi
	configure_neovim
	configure_terminal
	configure_privileged
	configure_xdg

	dots-refresh-all
fi
