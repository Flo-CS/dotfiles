# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

export DOTFILES_DIR=$HOME/.dotfiles
export DOTFILES_ID=florian.laptop
export DOTFILES_THEME_NAME=rose-pine
export DOTFILES_WALLPAPER_FILE=mountain.jpg
# For example: "v0.50.0". Can be empty if version should not be fixed.
export DOTFILES_HYPRLAND_PLUGINS_VERSION=

source ~/.default.bashrc

source /usr/share/nvm/init-nvm.sh

. "$HOME/.cargo/env"

. "$HOME/.atuin/bin/env"
[[ -f ~/.bash-preexec.sh ]] && source ~/.bash-preexec.sh
eval "$(atuin init bash)"
