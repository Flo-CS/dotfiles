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
	hyprpm remove --force https://github.com/hyprwm/hyprland-plugins
	hyprpm add --force https://github.com/hyprwm/hyprland-plugins $HYPRLAND_PLUGINS_VERSION
	hyprpm enable hyprexpo
fi

section "Hyprland Autostart"
insert_content_with_marker ~/.bash_profile "hyprland-autostart" "if uwsm check may-start; then 
	exec uwsm start hyprland.desktop
fi"

section "Uwsm"
install_packages uwsm libnewt
