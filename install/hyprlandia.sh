section "Hyprland"
install_packages hyprland hyprpaper hyprcursor hyprlock hypridle hyprland-qtutils hyprland-qt-support hyprpolkitagent
install_packages xdg-desktop-portal-hyprland xdg-desktop-portal-gtk
install_packages qt6-wayland qt5-wayland

mkdir -p ~/.config/hypr
create_dotfiles_symlink hypr/hyprland/custom-$DOTFILES_DEVICE_NAME.conf ~/.config/hypr/hyprland/custom.conf
create_dotfiles_symlink hypr/hyprland/keybinds.conf ~/.config/hypr/hyprland/keybinds.conf
create_dotfiles_symlink hypr/hyprland/rules.conf ~/.config/hypr/hyprland/rules.conf
create_dotfiles_symlink hypr/hyprland/exec.conf ~/.config/hypr/hyprland/exec.conf
create_dotfiles_symlink hypr/hyprland/env.conf ~/.config/hypr/hyprland/env.conf
create_dotfiles_symlink hypr/hyprland-themes/$HYPRLAND_THEME_NAME.conf ~/.config/hypr/hyprland-themes/main-theme.conf
create_dotfiles_symlink hypr/hyprland.conf ~/.config/hypr/hyprland.conf
hyprctl reload

create_dotfiles_symlink hypr/hypridle.conf ~/.config/hypr/hypridle.conf

create_dotfiles_symlink hypr/hyprpaper.conf ~/.config/hypr/hyprpaper.conf

create_dotfiles_symlink hypr/hyprlock.conf ~/.config/hypr/hyprlock.conf
create_dotfiles_symlink hypr/hyprlock ~/.config/hypr/hyprlock

section "Hyprland Plugins"
install_packages cmake meson cpio git gcc
if test -z "$HYPRLAND_PLUGINS_VERSION"; then
	echo "No version provided, cannot install hyprland-plugins"
else
	hyprpm update
	hyprpm remove https://github.com/hyprwm/hyprland-plugins
	hyprpm add https://github.com/hyprwm/hyprland-plugins $HYPRLAND_PLUGINS_VERSION
	hyprpm enable hyprexpo
fi

section "Hyprland Autostart"
insert_content_with_marker ~/.bash_profile "hyprland-autostart" "if uwsm check may-start; then 
	exec uwsm start hyprland.desktop
fi"

section "Uwsm"
install_packages uwsm libnewt

section "Waybar"
install_packages waybar
mkdir -p ~/.config/waybar
create_dotfiles_symlink waybar/config.jsonc ~/.config/waybar/config.jsonc
create_dotfiles_symlink waybar/style.css ~/.config/waybar/style.css
create_dotfiles_symlink waybar/themes/$WAYBAR_THEME_NAME.css ~/.config/waybar/main-theme.css

install_packages upower

section "Customization"
install_packages kvantum kvantum-qt5 # QT

section "Swaync"
install_packages swaync
mkdir -p ~/.config/swaync
create_dotfiles_copy swaync/style.css ~/.config/swaync/style.css
create_dotfiles_symlink swaync/config.json ~/.config/swaync/config.json
insert_content_with_marker ~/.config/swaync/style.css "theme" "$(cat $DOTFILES_DIR/configs/swaync/themes/$SWAYNC_THEME_NAME.css)" "/*" "*/"

section "Wofi"
install_packages wofi
mkdir -p ~/.config/wofi/config
create_dotfiles_symlink wofi/config ~/.config/wofi/config
create_dotfiles_copy wofi/style.css ~/.config/wofi/style.css
insert_content_with_marker ~/.config/wofi/style.css "theme" "$(cat $DOTFILES_DIR/configs/wofi/themes/rose-pine.css)" "/*" "*/"

section "Wofi menus"
create_dotfiles_symlink bin/wofi-emoji ~/.local/bin/wofi-emoji
section "Screenshots"
# TODO:

section "Fonts"
install_packages ttf-jetbrains-mono-nerd ttf-nerd-fonts-symbols

section "Quickshell"
install_packages qt6-shadertools cli11
if ! test -e ~/documents/quickshell; then
	git clone https://github.com/Flo-CS/quickshell.git ~/documents/quickshell
fi
# TODO: Why sudo is required? How to install as user?
cd ~/documents/quickshell && git pull && cmake -GNinja -B build -DCMAKE_BUILD_TYPE=ReleaseWithDebInfo -DCRASH_REPORTER=OFF &&
	cmake --build build &&
	sudo cmake --install build

create_dotfiles_symlink quickshell ~/.config/quickshell

section "Flatpak"
install_packages flatpak
flatpak remote-add --user --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

section "GTK 3 Theming"

section "GTK 4 Theming"

section "GTK icons"

section "QT Theming"
mkdir -p ~/.config/Kvantum
create_dotfiles_recursive_copy kvantum/themes/. ~/.config/Kvantum
create_dotfiles_symlink kvantum/kvantum.kvconfig ~/.config/Kvantum/kvantum.kvconfig
insert_content_with_marker ~/.config/Kvantum/kvantum.kvconfig "theme" "theme=$QT_KVANTUM_THEME_NAME"

section "Cursor icons"
create_dotfiles_recursive_copy cursor-icons/. ~/.local/share/icons
