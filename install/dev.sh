#!/usr/bin/env bash

source $DOTFILES_UTILS

section "Neovim"
install_packages neovim

section "Nodejs"
install_packages nvm
insert_content_with_marker ~/.bashrc "nvm" "source /usr/share/nvm/init-nvm.sh"
source ~/.bashrc
nvm install --lts

section "Git"
install_packages git git-filter-repo lazygit
