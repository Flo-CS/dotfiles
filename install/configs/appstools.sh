#!/usr/bin/env bash

source $DOTFILES_UTILS

section "Bat"
mkdir -p "$(bat --config-dir)"
create_dotfiles_symlink bat/config "$(bat --config-dir)/config"
create_dotfiles_symlink bat/themes/$BAT_THEME_NAME.tmTheme "$(bat --config-dir)/themes/main-theme.tmTheme"
bat cache --build

section "FZF"
mkdir -p ~/.local/bin/fzf
create_dotfiles_symlink fzf/$FZF_THEME_NAME.sh ~/.local/bin/fzf/main-theme.sh
insert_content_with_marker ~/.bashrc "fzf" "source ~/.local/bin/fzf/main-theme.sh"

section "Alacritty"
mkdir -p ~/.config/alacritty
create_dotfiles_symlink alacritty/themes/$ALACRITTY_THEME_NAME.toml ~/.config/alacritty/main-theme.toml
create_dotfiles_symlink alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml

section "Starship"
mkdir -p ~/.config/starship
create_dotfiles_copy starship/starship.toml ~/.config/starship.toml
insert_content_with_marker ~/.config/starship.toml "theme" "palette = \"$STARSHIP_THEME_NAME\""

section "Btop"
mkdir -p ~/.config/btop
create_dotfiles_symlink btop/btop.conf ~/.config/btop/btop.conf
create_dotfiles_symlink btop/themes/$BTOP_THEME_NAME.theme ~/.config/btop/main-theme.theme
