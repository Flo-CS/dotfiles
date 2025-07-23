section "Neovim"
install_packages neovim
create_dotfiles_symlink nvim ~/.config/nvim
echo $NVIM_THEME_NAME >~/.config/nvim/.theme
