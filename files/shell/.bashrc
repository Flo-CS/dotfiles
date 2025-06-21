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
# TODO: perhaps I should replace alias by functions to avoid issues with arguments
alias f='fd -H | fzf --style full --height 60% --reverse --preview "if [ -d {} ]; then tree -C {}; else bat {}; fi" --preview-window=right:60%'
alias fzfd='fd --type d -H | fzf --style full --height 60% --reverse --preview "tree -C {}" --preview-window=right:60%'
alias fzff='fd --type f -H | fzf --style full --height 60% --reverse --preview "bat {}" --preview-window=right:60%'

alias cdf='cd "./$(fzfd)"'

alias batf='bat "./$(fzff)"'

alias lsa='ls --color=auto -la --group-directories-first'
# alias ls='eza -a --icons=always'
# alias ll='eza -al --icons=always'
# alias lt='eza -a --tree --level=1 --icons=always'

alias shutdown='systemctl poweroff'

# VIM
alias vi='nvim'

alias nv='nvim'
alias nvf='nvim "./$(f)"'

# GIT
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias gpl="git pull"
alias gd="git diff"

if command -v starship &>/dev/null; then
  eval "$(starship init bash)"
fi

if command -v fzf &>/dev/null; then
  source ~/.local/bin/fzf/rose-pine.sh
fi

if command -v zoxide &>/dev/null; then
  eval "$(zoxide init bash)"
fi
