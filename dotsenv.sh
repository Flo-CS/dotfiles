export DOTFILES_USERNAME=${DOTFILES_USERNAME:-${USER:-$(whoami)}}
export DOTFILES_DEVICE_NAME=${DOTFILES_DEVICE_NAME:-${DEVICE_NAME:-$(hostname)}}

export DOTFILES_DIR=${DOTFILES_DIR:-$HOME/dotfiles}
export DOTFILES_INSTALL_DIR="$DOTFILES_DIR/install"
export DOTFILES_CONFIGS_DIR="$DOTFILES_INSTALL_DIR/configs"
export DOTFILES_UTILS="$DOTFILES_INSTALL_DIR/_utils.sh"

# Theming strategy: inject theme filename into a main config file
export ALACRITTY_THEME_NAME=rose-pine
export BAT_THEME_NAME=rose-pine
export BTOP_THEME_NAME=rose-pine
export HYPRLAND_THEME_NAME=rose-pine
export KVANTHUM_THEME_NAME=rose-pine-pine
export NVIM_THEME_NAME=rose-pine
export STARSHIP_THEME_NAME=rose-pine
export WAYBAR_THEME_NAME=rose-pine

# Theming strategy: call a script to set the env vars for theme inside bashrc
export FZF_THEME_NAME=rose-pine

# Theming strategy: inject content of a file into a main config file
export WOFI_THEME_NAME=rose-pine

export WALLPAPER_FILE=mountain
