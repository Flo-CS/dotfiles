#!/usr/bin/env bash

source $DOTFILES_UTILS

section "Audio"
install_packages sof-firmware pipewire wireplumber pipewire-audio pipewire-pulse pipewire-jack
