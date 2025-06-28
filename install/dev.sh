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
install_yay_packages git-credential-oauth

section "Rust"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

section "Docker"
install_packages docker docker-compose
sudo systemctl enable --now docker.socket # Start on first usage, different from .service which start on boot
