#!/usr/bin/env bash

source $DOTFILES_UTILS

section "Neovim"
create_dotfiles_symlink nvim ~/.config/nvim
echo $NVIM_THEME_NAME >~/.config/nvim/.theme

section "Git"
create_dotfiles_symlink gitconfig/.gitconfig ~/.gitconfig-default

insert_content_with_marker ~/.gitconfig "gitconfig-default" "[include]
	path = ~/.gitconfig-default"
