#!/usr/bin/env bash

source $DOTFILES_UTILS

create_dotfiles_symlink shell/.bashrc ~/.bashrc-default
insert_content_with_marker ~/.bashrc "bashrc-default" "source ~/.bashrc-default"

create_dotfiles_symlink shell/.profile ~/.profile-default
insert_content_with_marker ~/.bash_profile "profile-default" "source ~/.profile-default"
