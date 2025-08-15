#!/usr/bin/env bash

. $DOTS_DIR/bin/dots/utils.sh

_install_audio() {
	pacman_install sof-firmware
	pacman_install pipewire wireplumber pipewire-audio pipewire-pulse pipewire-jack
}

_config_bash() {
	symlink config/local/$DOTS_ID/.bashrc ~/.bashrc
	symlink config/local/$DOTS_ID/.bash_profile ~/.bash_profile
}

_install_bin() {
	symlink bin/wofi-emoji ~/.local/bin/wofi-emoji
}

_install_bluetooth() {
	sudo systemctl enable --now bluetooth.service
	yay_install bluetuith
}

_install_clipboard() {
	pacman_install wl-clipboard
}

_install_desktop() {
	# Waybar
	pacman_install waybar upower

	# QT Customization
	pacman_install kvantum kvantum-qt5

	# Swaync
	pacman_install swaync

	# Wofi
	pacman_install wofi

	# GTK 3 Theming

	# GTK 4 Theming

	# GTK icons
}

_config_desktop() {
	# Waybar
	symlink config/default/waybar.jsonc ~/.config/waybar/config.jsonc
	symlink config/theme/current/waybar.css ~/.config/waybar/style.css

	# QT Customization
	symlink config/default/kvantum.kvconfig ~/.config/Kvantum/kvantum.kvconfig
	symlink config/theme/current/kvantum ~/.config/Kvantum/current-theme

	# Swaync
	symlink config/default/swaync.json ~/.config/swaync/config.json
	symlink config/theme/current/swaync.css ~/.config/swaync/style.css

	# Wofi
	symlink config/default/wofi ~/.config/wofi/config
	symlink config/theme/current/wofi.css ~/.config/wofi/style.css

	# Cursor icons
	symlink config/theme/current/cursor-icons ~/.local/share/icons/cursor
}

_install_quickshell() {
	pacman_install qt6-shadertools cli11
	if ! test -e ~/documents/quickshell; then
		git clone https://github.com/Flo-CS/quickshell.git ~/documents/quickshell
	else
		# TODO: Why sudo is required? How to install as user?
		cd ~/documents/quickshell &&
			git pull &&
			cmake -GNinja -B build -DCMAKE_BUILD_TYPE=ReleaseWithDebInfo -DCRASH_REPORTER=OFF &&
			cmake --build build &&
			sudo cmake --install build &&
			cd -
	fi

	# TODO: move it inside assets or other folder
	symlink config/default/quickshell ~/.config/quickshell
}

_install_disks() {
	pacman_install gvfs udisks2
	pacman_install udiskie
	pacman_install dust
}

_install_docker() {
	pacman_install docker docker-compose
	yay_install lazydocker
	sudo systemctl enable --now docker.socket # Start on first usage, different from .service which start on boot
}

_install_files() {
	pacman_install bat fd ripgrep zoxide jq go-yq fzf

	pacman_install thunar yazi ranger nnn

	pacman_install rclone syncthing rsync

	# FIXME:
	# pacman_install localsend
}

_config_files() {
	symlink config/default/bat "$(bat --config-dir)/config"
	symlink config/theme/current/bat.tmTheme "$(bat --config-dir)/themes/current.tmTheme"
	bat cache --build

	symlink config/theme/current/fzf.sh ~/.local/bin/fzf/current-theme.sh
}

_install_flatpak() {
	pacman_install flatpak
	flatpak remote-add --user --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
}

_install_fonts() {
	pacman_install ttf-jetbrains-mono-nerd ttf-nerd-fonts-symbols

	# FIXME:
	# cargo install --git https://github.com/loichyan/nerdfix.git
}

_install_git() {
	pacman_install git git-filter-repo lazygit git-delta
	yay_install git-credential-oauth
}

_config_git() {
	symlink config/local/$DOTS_ID/.gitconfig ~/.gitconfig
}

_config_grub() {
	# os-prober is disabled by default in grub config and it's better for security reasons. But it is useful to detect other OSes and then add them manually to grub.
	windows_boot_partition_path=$(sudo os-prober | grep "Windows Boot Manager" | head -n 1 | cut -d'@' -f1 || echo "")
	if [[ -n $windows_boot_partition_path ]]; then
		log_info "detected Windows Boot Manager at: $windows_boot_partition_path"
		windows_boot_partition_uuid=$(sudo blkid -s UUID -o value "$windows_boot_partition_path" 2>/dev/null)
		if [[ -z $windows_boot_partition_uuid ]]; then
			windows_boot_partition_uuid=$(lsblk -no UUID "$windows_boot_partition_path" 2>/dev/null)
			if [[ -z $windows_boot_partition_uuid ]]; then
				log_error "unable to retrieve UUID for Windows Boot Manager partition."
				exit 1
			fi
		fi

		echo $(pwd)
		log_info "Windows Boot Manager UUID: $windows_boot_partition_uuid"
		sudo -E $DOTS_DIR/bin/dots/utils.sh insert_with_marker /etc/grub.d/40_custom "windows" "
menuentry 'Windows Boot Manager' --class windows --class os {
    search --fs-uuid --no-floppy --set=root $windows_boot_partition_uuid
    chainloader /EFI/Microsoft/Boot/bootmgfw.efi
}
"
	else
		log_warn "no Windows Boot Manager found. Skipping Windows entry in GRUB."
	fi

	grep -q '^GRUB_DEFAULT=' /etc/default/grub && sudo sed -i 's/^GRUB_DEFAULT=.*/GRUB_DEFAULT=saved/' /etc/default/grub
}

_install_hyprlandia() {
	pacman_install hyprland hyprpaper hyprcursor hyprlock hypridle hyprland-qtutils hyprland-qt-support hyprpolkitagent
	pacman_install xdg-desktop-portal-hyprland xdg-desktop-portal-gtk
	pacman_install qt6-wayland qt5-wayland

	pacman_install cmake meson cpio git gcc
	hyprpm add --force https://github.com/hyprwm/hyprland-plugins $DOTS_HYPRLAND_PLUGINS_VERSION || log_warn "hyprpm add failed"
	hyprpm update || log_warn "hyprpm update failed"
	hyprpm enable hyprexpo || log_warn "hyprpm enable hyprexpo failed"

	pacman_install uwsm libnewt
}

_config_hyprlandia() {
	symlink config/local/$DOTS_ID/hypr/hyprland.conf ~/.config/hypr/hyprland.conf
	symlink config/local/$DOTS_ID/hypr/hyprlock.conf ~/.config/hypr/hyprlock.conf
	symlink config/default/hypr/hypridle.conf ~/.config/hypr/hypridle.conf
	symlink config/default/hypr/hyprpaper.conf ~/.config/hypr/hyprpaper.conf
	hyprctl reload || log_warn "hyprctl reload failed, maybe hyprland is not running yet"
}

_install_manual() {
	pacman_install man-pages tldr
}

_install_multimedia() {
	pacman_install playerctl
}

_install_neovim() {
	pacman_install neovim
}

_config_neovim() {
	symlink config/default/nvim ~/.config/nvim
	symlink config/theme/current/nvim.theme ~/.config/nvim/.theme
}

_install_programming_languages() {
	pacman_install python-j2cli

	pacman_install python-pip

	pacman_install nvm
	source ~/.bashrc || log_error "Failed to source .bashrc to load nvm" # FIXME:: this seems to always been broken, why?
	nvm install --lts || log_error "nvm install failed, maybe nvm is not properly configured"

	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
}

_config_sudoers() {
	sudo -E $DOTS_DIR/bin/dots/utils.sh copy config/default/sudoers /etc/sudoers.d/sudoers-default
}

_install_system_backup() {
	pacman_install snapper snap-pac inotify-tools grub-btrfs
}

_config_system_backup() {
	# WARNING: The boot on snapshot part (managed by grub-btrfs) will only work with EndeavourOS because it uses dracut.
	# For raw ArchLinux systems, see grub-btrfs docs for more information and the alternative way to boot on snapshot.

	sudo snapper -c root create-config / || log_error "Failed to create snapper config, maybe root config already exists"

	sudo -E $DOTS_DIR/bin/dots/utils.sh backup /etc/snapper/configs/root

	sudo snapper -c root set-config ALLOW_USERS="$USER"
	sudo snapper -c root set-config TIMELINE_LIMIT_HOURLY="10"
	sudo snapper -c root set-config TIMELINE_LIMIT_DAILY="5"
	sudo snapper -c root set-config TIMELINE_LIMIT_WEEKLY="3"
	sudo snapper -c root set-config TIMELINE_LIMIT_MONTHLY="0"
	sudo snapper -c root set-config TIMELINE_LIMIT_YEARLY="0"

	sudo systemctl enable --now snapper-timeline.timer snapper-cleanup.timer

	# WARNING: only work on EndeavourOS because it uses dracut
	sudo -E $DOTS_DIR/bin/dots/utils.sh backup /etc/default/grub-btrfs/config
	sudo -E $DOTS_DIR/bin/dots/utils.sh insert_with_marker /etc/default/grub-btrfs/config "custom" "GRUB_BTRFS_SNAPSHOT_KERNEL_PARAMETERS=\"rd.live.overlay.overlayfs=1\""

	sudo systemctl enable --now grub-btrfsd
}

_install_system_controls() {
	pacman_install brightnessctl power-profiles-daemon
}

_install_system_monitoring() {
	pacman_install fastfetch btop
}

_config_system_monitoring() {
	symlink config/default/btop.conf ~/.config/btop/btop.conf
	symlink config/theme/current/btop.theme ~/.config/btop/current.theme
}

_install_terminal() {
	pacman_install glow gum

	curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh

	pacman_install alacritty
	pacman_uninstall xterm || log_warn "xterm is already uninstalled, skipping"
	sudo ln -sf /usr/bin/alacritty /usr/bin/xterm # Stupid workaround to allow to run .desktop files that require by default xterm (i don't know how to change it)

	pacman_install starship
}

_config_terminal() {
	symlink config/default/atuin.toml ~/.config/atuin/config.toml

	symlink config/default/alacritty.toml ~/.config/alacritty/alacritty.toml
	symlink config/theme/current/alacritty.toml ~/.config/alacritty/current-theme.toml

	template config/default/starship.toml.j2
	symlink config/default/starship.toml ~/.config/starship.toml
}

_config_xdg() {
	symlink config/default/user-dirs.dirs ~/.config/user-dirs.dirs
}

OPTIONS=(
	"bash"
	"terminal"
	"git"
	"hyprlandia"
	"audio"
	"bin"
	"bluetooth"
	"clipboard"
	"desktop"
	"disks"
	"docker"
	"files"
	"flatpak"
	"fonts"
	"grub"
	"manual"
	"multimedia"
	"neovim"
	"programming_languages"
	"sudoers"
	"system_backup"
	"system_controls"
	"system_monitoring"
	"xdg"
)

_build_fn_from_option() {
	local option="$1"
	local suffix="$2"
	local fn=$(echo "$option" | cut -d"-" -f 2)
	echo "_${suffix}_${fn}"
}

list_options() {
	echo ${OPTIONS[@]} | tr ' ' '\n' | sort -u
}

choose_options() {
	gum filter --no-limit --header "What to run ?" $(list_options)
}

run_options() {
	local areas=$(echo "$1" | tr ',' ' ')
	local options=$2
	for option in $options; do
		for area in $areas; do
			local fn=$(_build_fn_from_option "$option" "$area")
			if type "$fn" &>/dev/null; then
				log_section "Running $option"
				"$fn"
			fi
		done
	done
}

main() {
	local command="$1"
	case "$command" in
	run)
		local areas=${2:-"install,config"}
		local options=${3:-$(choose_options)}
		run_options "$areas" "$options"
		;;
	list)
		list_options
		;;
	esac
}

main "$@"
