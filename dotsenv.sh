if [[ -z "$DOTFILES_DIR" ]]; then
	echo "DOTFILES_DIR is not set. Please set it to the path of your dotfiles directory."
	exit 1
fi

export DOTFILES_USERNAME=${DOTFILES_USERNAME:-${USER:-$(whoami)}}
export DOTFILES_DEVICE_NAME=${DOTFILES_DEVICE_NAME:-${DEVICE_NAME:-$(hostname)}}

export DOTFILES_INSTALL_DIR="$DOTFILES_DIR/install"
export DOTFILES_CONFIGS_DIR="$DOTFILES_INSTALL_DIR/configs"
export DOTFILES_UTILS="$DOTFILES_INSTALL_DIR/_utils.sh"

# Theming strategy: inject theme filename into a main config file
export ALACRITTY_THEME_NAME=rose-pine # X
export BAT_THEME_NAME=rose-pine       # X
export BTOP_THEME_NAME=rose-pine      # X
export HYPRLAND_THEME_NAME=rose-pine  # X
export WAYBAR_THEME_NAME=rose-pine    # X
export SWAYNC_THEME_NAME=rose-pine    # X

# Theming strategy: inject theme name into a main config file
export STARSHIP_THEME_NAME=rose-pine        # X
export QT_KVANTUM_THEME_NAME=rose-pine-pine # X
export NVIM_THEME_NAME=rose-pine

# Theming strategy: call a script to set the env vars for theme inside bashrc
export FZF_THEME_NAME=rose-pine # X

# Theming strategy: inject content of a file into a main config file
export WOFI_THEME_NAME=rose-pine # X

# Theming strategy: WTF, this is so stupid
export GTK_THEME_NAME=Rose-Pine # X

export WALLPAPER_FILE=mountain.jpg
