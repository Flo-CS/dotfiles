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
alias cdf='cd "./$(find -type d | fzf --height 40% --reverse --preview "tree -C {}" --preview-window=up:40%)"'
alias lsa='ls --color=auto -la --group-directories-first'
alias lsf='lsa "./$(find -type d | fzf --height 40% --reverse --preview "tree -C {}" --preview-window=up:40%)"'
# alias ls='eza -a --icons=always'
# alias ll='eza -al --icons=always'
# alias lt='eza -a --tree --level=1 --icons=always'
alias shutdown='systemctl poweroff'

# VIM
alias vi='nvim'
alias vim='nvim'

alias nv='nvim'
alias nvdf='nvim "./$(find -type d | fzf --height 40% --reverse --preview "tree -C {}" --preview-window=up:40%)"'
alias nvf='nvim "./$(find -type f | fzf --height 40% --reverse --preview "bat --color=always {}" --preview-window=up:40%)"'

alias truevim='vim'

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
