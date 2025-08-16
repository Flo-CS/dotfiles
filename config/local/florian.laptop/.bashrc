export DOTS_DIR=$HOME/.dotfiles
export DOTS_ID=florian.laptop
# For example: "v0.50.0". Can be empty if version should not be fixed.
export DOTS_HYPRLAND_PLUGINS_VERSION=""

source ~/.dotfiles/config/default/.bashrc

. "$HOME/.atuin/bin/env"
[[ -f ~/.bash-preexec.sh ]] && source ~/.bash-preexec.sh
eval "$(atuin init bash)"

. "$HOME/.cargo/env"
