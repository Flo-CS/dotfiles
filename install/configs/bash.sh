#!/usr/bin/env bash

source $DOTFILES_UTILS

section "Bash"
create_dotfiles_symlink shell/.bashrc ~/.bashrc-default
insert_content_with_marker ~/.bashrc "bashrc-default" "source ~/.bashrc-default"

insert_content_with_marker ~/.bashrc "dotsenv" "export DOTFILES_DIR=$HOME/dotfiles && source $DOTFILES_DIR/dotsenv.sh"

section "Bash Profile"
create_dotfiles_symlink shell/.profile ~/.profile-default
insert_content_with_marker ~/.bash_profile "profile-default" "source ~/.profile-default"
