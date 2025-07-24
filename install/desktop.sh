log_section "Waybar"
install_pkgs waybar upower
conf_ln waybar.jsonc ~/.config/waybar/config.jsonc
theme_conf_ln waybar.css ~/.config/waybar/style.css

log_section "QT Customization"
install_pkgs kvantum kvantum-qt5
conf_ln kvantum.kvconfig ~/.config/Kvantum/kvantum.kvconfig
theme_conf_ln kvantum ~/.config/Kvantum/current-theme

log_section "Swaync"
install_pkgs swaync
conf_ln swaync.json ~/.config/swaync/config.json
theme_conf_ln swaync.css ~/.config/swaync/style.css

log_section "Wofi"
install_pkgs wofi
conf_ln wofi ~/.config/wofi/config
theme_conf_ln wofi.css ~/.config/wofi/style.css

log_section "Wofi menus"
bin_ln wofi-emoji ~/.local/bin/wofi-emoji

log_section "Quickshell"
install_pkgs qt6-shadertools cli11
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
conf_ln quickshell ~/.config/quickshell

log_section "GTK 3 Theming"

log_section "GTK 4 Theming"

log_section "GTK icons"

log_section "Cursor icons"
theme_conf_ln cursor-icons ~/.local/share/icons/cursor
