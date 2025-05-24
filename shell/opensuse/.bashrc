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
# Fuzzy find file and directory, if it's a file, use bat to preview it and if it's a directory, use tree to preview it
alias f='find | fzf --style full --height 60% --reverse --preview "if [ -d {} ]; then tree -C {}; else bat --color=always {}; fi" --preview-window=right:60%'
alias fzd='find -type d | fzf --style full --height 60% --reverse --preview "tree -C {}" --preview-window=right:60%'
alias fzf='find -type f | fzf --style full --height 60% --reverse --preview "bat --color=always {}" --preview-window=right:60%'

alias cdf='cd "./$(fzd)"'

alias lsa='ls --color=auto -la --group-directories-first'
# alias ls='eza -a --icons=always'
# alias ll='eza -al --icons=always'
# alias lt='eza -a --tree --level=1 --icons=always'

alias shutdown='systemctl poweroff'

# VIM
alias vi='nvim'
alias vim='nvim'

alias nv='nvim'
alias nvf='nvim "./$(f)"'

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
