section "Bash"
create_dotfiles_symlink .bashrc ~/.bashrc-default
insert_content_with_marker ~/.bashrc "bashrc-default" "source ~/.bashrc-default"

section "Bash Profile"
create_dotfiles_symlink .bash_profile ~/.profile-default
insert_content_with_marker ~/.bash_profile "profile-default" "source ~/.profile-default"
