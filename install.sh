#!/usr/bin/env bash

source "$DOTFILES_DIR/dotsenv.sh" || exit 1
source "$DOTFILES_DIR/dotsutils.sh" || exit 1

install_files=$DOTFILES_DIR/install/*.sh

selected_install_files=$(gum filter --no-limit $install_files)

for f in $selected_install_files; do
	. $f
done

sudo snapper -c root create --description "After system setup" -u important=yes
