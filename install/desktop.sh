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
insert_content_with_marker ~/.config/swaync/style.css "theme" "$(cat $DOTFILES_DIR/config/swaync/themes/$SWAYNC_THEME_NAME.css)" "/*" "*/"

section "Wofi"
install_packages wofi
mkdir -p ~/.config/wofi/config
create_dotfiles_symlink wofi/config ~/.config/wofi/config
create_dotfiles_copy wofi/style.css ~/.config/wofi/style.css
insert_content_with_marker ~/.config/wofi/style.css "theme" "$(cat $DOTFILES_DIR/config/wofi/themes/rose-pine.css)" "/*" "*/"

section "Wofi menus"
create_dotfiles_symlink bin/wofi-emoji ~/.local/bin/wofi-emoji

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

section "GTK 3 Theming"

section "GTK 4 Theming"

section "GTK icons"

section "QT Theming"
mkdir -p ~/.config/Kvantum
create_dotfiles_recursive_copy kvantum/themes/. ~/.config/Kvantum
create_dotfiles_symlink kvantum/kvantum.kvconfig ~/.config/Kvantum/kvantum.kvconfig
insert_content_with_marker ~/.config/Kvantum/kvantum.kvconfig "theme" "theme=$QT_KVANTUM_THEME_NAME"

section "Cursor icons"
create_dotfiles_assets_recursive_copy cursor-icons/. ~/.local/share/icons
