section "Fastfetch"
install_packages fastfetch

section "Btop"
install_packages btop
mkdir -p ~/.config/btop
create_dotfiles_symlink btop/btop.conf ~/.config/btop/btop.conf
create_dotfiles_symlink btop/themes/$BTOP_THEME_NAME.theme ~/.config/btop/main-theme.theme
