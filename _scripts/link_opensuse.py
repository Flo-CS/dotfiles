#!/usr/bin/env python3

import os

def dotfiles_symlink(dotfiles_src, user_dst):
    final_src = os.path.expanduser('~/dotfiles/' + dotfiles_src)
    final_dst = os.path.expanduser('~/' + user_dst)
    if not os.path.exists(final_src):
        print(f"Source {final_src} does not exist, skipping symlink creation.")
        return
    if os.path.exists(final_dst):
        print(f"Destination {final_dst} already exists, skipping symlink creation.")
        return
    print(f"Creating symlink from {final_src} to {final_dst}")
    os.symlink(final_src, final_dst)

dotfiles_symlink('hypr', '.config/hypr')
dotfiles_symlink('nvim', '.config/nvim')
dotfiles_symlink('waybar', '.config/waybar')
dotfiles_symlink('wofi', '.config/wofi')
dotfiles_symlink('kitty', '.config/kitty')

dotfiles_symlink('starship/starship.toml', '.config/starship/starship.toml')
dotfiles_symlink('shell/opensuse/.bashrc', '.bashrc')
dotfiles_symlink('shell/opensuse/.profile', '.profile')
dotfiles_symlink('gitconfig/opensuse/.gitconfig', '.gitconfig')
