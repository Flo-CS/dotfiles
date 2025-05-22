# Sample .bashrc for SUSE Linux
# Copyright (c) SUSE Software Solutions Germany GmbH

# There are 3 different types of shells in bash: the login shell, normal shell
# and interactive shell. Login shells read ~/.profile and interactive shells
# read ~/.bashrc; in our setup, /etc/profile sources ~/.bashrc - thus all
# settings made here will also take effect in a login shell.
#
# NOTE: It is recommended to make language settings in ~/.profile rather than
# here, since multilingual X sessions would not work properly if LANG is over-
# ridden in every subshell.

export EDITOR=/usr/bin/nvim
export SYSTEMD_EDITOR=/usr/bin/nvim
export TERMINAL=alacritty

alias lsa='ls --color=auto -la'

alias truevim='vim'
alias vim='nvim'

if command -v starship &>/dev/null; then
  eval "$(starship init bash)"
fi

if command -v fzf &>/dev/null; then
  source ~/.local/bin/fzf/rose-pine.sh
fi
