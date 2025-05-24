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

# GENERAL
alias lsa='ls --color=auto -la'
# alias ls='eza -a --icons=always'
# alias ll='eza -al --icons=always'
# alias lt='eza -a --tree --level=1 --icons=always'
alias shutdown='systemctl poweroff'

# VIM
alias truevim='vim'
alias vim='nvim'
alias vi='nvim'
alias v='nvim'

# GIT
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias gpl="git pull"

if command -v starship &>/dev/null; then
  eval "$(starship init bash)"
fi

if command -v fzf &>/dev/null; then
  source ~/.local/bin/fzf/rose-pine.sh
fi
