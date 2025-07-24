log_section "Bat"
install_pkgs bat
conf_ln bat "$(bat --config-dir)/config"
theme_conf_ln bat.tmTheme "$(bat --config-dir)/themes/current.tmTheme"
bat cache --build

log_section "Fzf"
install_pkgs fzf
theme_conf_ln fzf.sh ~/.local/bin/fzf/current-theme.sh

log_section "Fd"
install_pkgs fd

log_section "Ripgrep"
install_pkgs ripgrep

log_section "Zoxide"
install_pkgs zoxide

log_section "Jq and Go-yq"
install_pkgs jq go-yq

log_section "Files managers"
install_pkgs thunar yazi ranger nnn

log_section "Sync"
install_pkgs rclone syncthing rsync

log_section "Localsend"
# FIXME:
# install_pkgs localsend
