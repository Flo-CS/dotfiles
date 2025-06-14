#!/usr/bin/env bash

source $DOTFILES_UTILS

sudo create_dotfiles_copy system/sudoers/$DOTFILES_USERNAME /etc/sudoers.d/$DOTFILES_USERNAME
