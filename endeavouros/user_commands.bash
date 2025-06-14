git clone https://Flo-CS@github.com/Flo-CS/config.dotfiles.git ~/dotfiles

source ~/dotfiles/install/_env.sh
~/dotfiles/install/snapper.sh
~/dotfiles/install/configs/snapper.sh

sudo snapper -c root create --description "After installation" -u important=yes
