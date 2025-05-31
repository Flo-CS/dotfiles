# README

## ISO, USB, and Installation

Use Ventoy to create a bootable USB drive allowing to boot multiple ISO files from the same USB drive.

Note that the USB drive can still be used to store files other tha ISO files. Most commonly files to set up the system after installation.
They should be placed in a directory with a file named .ventoyignore.

## OpenSUSE Tumbleweed

1) Install OpenSUSE Tumbleweed
    - Do not modify existing Windows partitions if any
    - With the server preset but
      - remove yast server utilities
      - add fonts
      - add x11 window system, and only select SDDM display manager
      - block SSH
      - select graphic mode systemd target
    - Disable autologin
2) Use nmcli or nmtui to connect to internet
3) Make zypper update or zypper dup
4) Install hyprland, alacritty
5) Install xwayland because some apps still need X to work (in the future I want to remove it completly), see XWayland part of this docs for more information
6) Run hyprland one time and close it
7) Update the generated hyprland.conf file to change the keyboard layout, the terminal, the generated message, and screen zoom
8) Install git, git-credential-oauth, MozillaFirefox
9) Download KeepassXC AppImage (because trustworthy), warning it only runs on X for now
10) Download KeepassXC database
11) Authenticate to Github and clone dotfiles
12) Install the dotfiles
13) Run the temporary stupid-install-script.sh

## EndeavourOS
