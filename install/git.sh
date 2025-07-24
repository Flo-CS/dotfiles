log_section "Git"
install_pkgs git git-filter-repo lazygit git-delta
install_yay_pkgs git-credential-oauth
conf_ln .gitconfig ~/.gitconfig
