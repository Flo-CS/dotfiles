# README

## Pre-dotfiles OpenSUSE Tumbleweed

1) Install OpenSUSE Tumbleweed
- Do not modify existing Windows partitions if any
- With the server preset but
  - remove yast server utilities
  - add fonts
  - add x11 window system, and only select SDDM display manager
  - block SSH
  - select graphic mode systemd target
- Disable autologin
3) Use nmcli or nmtui to connect to internet
4) Make zypper update or zypper dup
5) Install hyprland, alacritty
6) Install xwayland because some apps still need X to work (in the future I want to remove it completly), see XWayland part of this docs for more information
7) Run hyprland one time and close it
8) Update the generated hyprland.conf file to change the keyboard layout, the terminal, the generated message, and screen zoom
9) Install git, git-credential-oauth, MozillaFirefox
10) Download KeepassXC AppImage (because trustworthy), warning it only runs on X for now
11) Download KeepassXC database
12) Authenticate to Github and clone dotfiles

## Pre-dotfiles EndeavourOS

## Dotfiles

1) Install the dotfiles
2) Run the temporary stupid-install-script.sh

## Perhaps later

- Each time recommended packages are selected automatically by zypper, I keep them, even in the install process. We can not select recommended packages, perhaps I should later

## See Wiki


