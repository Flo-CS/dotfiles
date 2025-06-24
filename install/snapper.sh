#!/usr/bin/env bash

source $DOTFILES_UTILS

section "Snapper"
install_packages snapper snap-pac inotify-tools grub-btrfs
