#!/usr/bin/env bash

source $DOTFILES_UTILS

# bat
mkdir -p "$(bat --config-dir)"
create_dotfiles_symlink bat/config "$(bat --config-dir)/config"
create_dotfiles_symlink bat/themes/$BAT_THEME_NAME.tmTheme "$(bat --config-dir)/themes/main-theme.tmTheme"
bat cache --build

# fzf
mkdir -p ~/.local/bin/fzf
create_dotfiles_symlink fzf/rose-pine.sh ~/.local/bin/fzf/rose-pine.sh

# alacritty
mkdir -p ~/.config/alacritty
create_dotfiles_symlink alacritty/themes/$ALACRITTY_THEME_NAME.toml ~/.config/alacritty/main-theme.toml
create_dotfiles_symlink alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml

# starship
mkdir -p ~/.config/starship
create_dotfiles_copy starship/starship.toml ~/.config/starship.toml
insert_content_with_marker ~/.config/starship.toml "theme" "palette = \"$STARSHIP_THEME_NAME\""

# btop
mkdir -p ~/.config/btop
create_dotfiles_symlink btop/btop.conf ~/.config/btop/btop.conf
create_dotfiles_symlink btop/themes/$BTOP_THEME_NAME.theme ~/.config/btop/main-theme.theme
