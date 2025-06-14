#!/usr/bin/env bash

source ../_utils.sh

sudo create_dotfiles_copy system/sudoers/$DOTFILES_USERNAME /etc/sudoers.d/$DOTFILES_USERNAME
