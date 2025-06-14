#!/usr/bin/env bash

source $DOTFILES_UTILS

# neovim
create_dotfiles_symlink nvim ~/.config/nvim

# git
create_dotfiles_symlink gitconfig/.gitconfig ~/.gitconfig-default

insert_content_with_marker ~/.gitconfig "gitconfig-default" "[include]
	path = ~/.gitconfig-default"
