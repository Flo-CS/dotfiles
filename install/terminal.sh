log_section "Gum, Glow"
install_pkgs glow gum

log_section "Atuin"
curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh

log_section "Alacritty"
install_pkgs alacritty
uninstall_pkgs xterm
conf_ln alacritty.toml ~/.config/alacritty/alacritty.toml
theme_conf_ln alacritty.toml ~/.config/alacritty/current-theme.toml
sudo ln -s /usr/bin/alacritty /usr/bin/xterm # Stupid workaround to allow to run .desktop files that require by default xterm (i don't know how to change it)

log_section "Starship"
install_pkgs starship
conf_template starship.toml.j2
conf_ln starship.toml ~/.config/starship.toml
