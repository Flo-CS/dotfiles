#!/usr/bin/env bash

source ../_utils.sh

create_dotfiles_symlink shell/.bashrc ~/.bashrc-default
insert_content_with_marker ~/.bashrc "custom" "source ~/.bashrc-default"

create_dotfiles_symlink shell/.profile ~/.profile-default
insert_content_with_marker ~/.bash_profile "custom" "source ~/.profile-default"
