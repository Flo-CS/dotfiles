section "Bat"
install_packages bat
mkdir -p "$(bat --config-dir)"
create_dotfiles_symlink bat/config "$(bat --config-dir)/config"
create_dotfiles_symlink bat/themes/$BAT_THEME_NAME.tmTheme "$(bat --config-dir)/themes/main-theme.tmTheme"
bat cache --build

section "Fzf"
install_packages fzf
mkdir -p ~/.local/bin/fzf
create_dotfiles_symlink fzf/$FZF_THEME_NAME.sh ~/.local/bin/fzf/main-theme.sh
insert_content_with_marker ~/.bashrc "fzf" "source ~/.local/bin/fzf/main-theme.sh"

section "Fd"
install_packages fd

section "Ripgrep"
install_packages ripgrep

section "Zoxide"
install_packages zoxide

section "Jq and Go-yq"
install_packages jq go-yq

section "Files managers"
install_packages thunar yazi ranger nnn

section "Sync"
install_packages rclone syncthing rsync

section "Localsend"
# FIXME:
# install_packages localsend
