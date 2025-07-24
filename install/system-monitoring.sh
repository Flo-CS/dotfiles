log_section "Fastfetch"
install_pkgs fastfetch

log_section "Btop"
install_pkgs btop
conf_ln btop.conf ~/.config/btop/btop.conf
theme_conf_ln btop.theme ~/.config/btop/current.theme
