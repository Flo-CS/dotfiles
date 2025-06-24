#!/usr/bin/env bash

source $DOTFILES_UTILS

section "User Dirs"
create_dotfiles_symlink system/user-dirs.dirs ~/.config/user-dirs.dirs
