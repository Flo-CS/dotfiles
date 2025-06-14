#!/usr/bin/env bash

source $DOTFILES_UTILS

# neovim
install_packages neovim

# nodejs
install_packages nvm
insert_content_with_marker ~/.bashrc "nvm" "source /usr/share/nvm/init-nvm.sh"
source ~/.bashrc
nvm install --lts

# git
install_packages git git-filter-repo
