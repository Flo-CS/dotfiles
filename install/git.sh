section "Git"
install_packages git git-filter-repo lazygit
install_yay_packages git-credential-oauth

create_dotfiles_symlink gitconfig/.gitconfig ~/.gitconfig-default

insert_content_with_marker ~/.gitconfig "gitconfig-default" "[include]
	path = ~/.gitconfig-default"
