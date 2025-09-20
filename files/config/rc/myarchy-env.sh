set -a && $XDG_CONFIG_HOME/myarchy/settings.env && set +a

export PATH="$MYARCHY_DIR/bin:$PATH"

# Can also be set using hyprctl setcursor
export HYPRCURSOR_THEME=BreezeX-RoséPineDawn
export HYPRCURSOR_SIZE=24

export XCURSOR_THEME=BreezeX-RoséPineDawn
export XCURSOR_SIZE=24

export QT_QPA_PLATFORM='wayland;xcb'
export QT_QPA_PLATFORMTHEME=qt6ct
export QT_STYLE_OVERRIDE=Kvantum

export LIBVA_DRIVER_NAME=nvidia
export __GLX_VENDOR_LIBRARY_NAME=nvidia

source $MYARCHY_DIR/files/themes/current/fzf.sh
source $MYARCHY_DIR/files/themes/current/gum.sh
