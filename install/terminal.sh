section "Gum, Glow"
install_packages glow gum

section "Alacritty"
install_packages alacritty
uninstall_packages xterm
mkdir -p ~/.config/alacritty
create_dotfiles_symlink alacritty/themes/$ALACRITTY_THEME_NAME.toml ~/.config/alacritty/main-theme.toml
create_dotfiles_symlink alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml

sudo ln -s /usr/bin/alacritty /usr/bin/xterm # Stupid workaround to allow to run .desktop files that require by default xterm (i don't know how to change it)

section "Starship"
install_packages starship
mkdir -p ~/.config/starship
create_dotfiles_copy starship/starship.toml ~/.config/starship.toml
insert_content_with_marker ~/.config/starship.toml "theme" "palette = \"$STARSHIP_THEME_NAME\""
