source "$DOTFILES_DIR/dotsenv.sh" || exit 1
source $DOTFILES_UTILS

$DOTFILES_INSTALL_DIR/snapper.sh
$DOTFILES_CONFIGS_DIR/snapper.sh

sudo snapper -c root create --description "After installation" -u important=yes

$DOTFILES_INSTALL_DIR/system.sh
$DOTFILES_CONFIGS_DIR/system.sh

$DOTFILES_INSTALL_DIR/desktopenv.sh
$DOTFILES_CONFIGS_DIR/desktopenv.sh

$DOTFILES_INSTALL_DIR/appstools.sh
$DOTFILES_CONFIGS_DIR/appstools.sh

$DOTFILES_INSTALL_DIR/dev.sh
$DOTFILES_CONFIGS_DIR/dev.sh

$DOTFILES_CONFIGS_DIR/user.sh
$DOTFILES_CONFIGS_DIR/bash.sh

sudo snapper -c root create --description "After system setup" -u important=yes
