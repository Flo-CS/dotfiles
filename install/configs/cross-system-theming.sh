#!/usr/bin/env bash

source $DOTFILES_UTILS

section "GTK 3 Theming"

section "GTK 4 Theming"

section "QT Theming"
mkdir -p ~/.config/Kvantum
create_dotfiles_recursive_copy kvantum/themes/. ~/.config/Kvantum
create_dotfiles_symlink kvantum/kvantum.kvconfig ~/.config/Kvantum/kvantum.kvconfig
insert_content_with_marker ~/.config/Kvantum/kvantum.kvconfig "theme" "theme=$QT_KVANTUM_THEME_NAME"

section "Cursor icons"
create_dotfiles_recursive_copy cursor-icons/. ~/.local/share/icons
