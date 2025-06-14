#!/usr/bin/env bash

source $DOTFILES_UTILS

# files-handling
mkdir -p "$(bat --config-dir)"
create_dotfiles_symlink bat "$(bat --config-dir)"
bat cache --build

mkdir -p ~/.local/bin/fzf
create_dotfiles_symlink fzf/rose-pine.sh ~/.local/bin/fzf/rose-pine.sh

# terminal
create_dotfiles_symlink alacritty ~/.config/alacritty
create_dotfiles_symlink starship/starship.toml ~/.config/starship.toml
insert_content_with_marker ~/.bashrc "starship" "$(cat ~/.config/starship.toml)"

# system-monitoring
mkdir -p ~/.config/btop
create_dotfiles_symlink btop/btop.conf ~/.config/btop/btop.conf
create_dotfiles_symlink btop/themes ~/.config/btop/themes
