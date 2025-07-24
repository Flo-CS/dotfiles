log_section "Hyprlandia"
install_pkgs hyprland hyprpaper hyprcursor hyprlock hypridle hyprland-qtutils hyprland-qt-support hyprpolkitagent
install_pkgs xdg-desktop-portal-hyprland xdg-desktop-portal-gtk
install_pkgs qt6-wayland qt5-wayland
conf_ln hypr ~/.config/hypr
theme_conf_ln hyprland.conf ~/.config/hypr/current-theme.conf
hyprctl reload

log_section "Hyprland Plugins"
install_pkgs cmake meson cpio git gcc
hyprpm add --force https://github.com/hyprwm/hyprland-plugins $HYPRLAND_PLUGINS_VERSION
hyprpm update
hyprpm enable hyprexpo

log_section "Uwsm"
install_pkgs uwsm libnewt
