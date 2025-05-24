# README

## Pre-dotfiles

1) Install OpenSUSE Tumbleweed
  - Do not modify existing Windows partitions if any
  - With the server preset but
      - remove yast server utilities
      - add fonts
      - add x11 patterns, but remove icewm, and only select SDDM display manager
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

## Dotfiles

1) Install the dotfiles
2) Run the temporary stupid-install-script.sh

## Perhaps later

- Each time recommended packages are selected automatically by zypper, I keep them, even in the install process. We can not select recommended packages, perhaps I should later

## Backup tool

Before starting, it's good to install a tool to snapshot/backup in case of mistake, so we can rollback

INFO: There is also timeshift, but snapper is created by the OpenSUSE team I think

## Sound

INFO: Pipewire is a replacement for the old two pulseaudio + jack audio servers

Without it my output audio system was not detected: sof-firmware

INFO: sof-firmware is a collection of open source linux firmwares for commercial hardwares like Intel sound chips

## NVidia drivers

Installing NVidia drivers is important

https://en.opensuse.org/SDB:NVIDIA_drivers

NOTE: Is it useful to install prime-select tools ? (Prime is some kind of technology to switch between integrated graphics and GPU card if I understand correctly)

## Git

Storing Git credentials is way more complicated than I thought, there is some options:
- Github CLI (not working like I want)
- Git Credential Manager (designed for Windows so complicated on Linux)
- Git cache, but each time cache expires we should generate new token, because Github does not allow usage of password to login
- Git plain text, not very secure, even if it's a token

The only simple and secure solution I found is using git-credential-oauth

INFO: To learn more https://git-scm.com/doc/credential-helpers and https://git-scm.com/docs/gitcredentials

## Hyprland

Hyprland is an implementation of the Wayland protocol, which is the successor of the old X11

## QT Theming: Kvantum

Alternative tool to qt5ct or qt6ct to customize QT applications theme, env vars are set in hyprland to use Kvantum

zypper install kvantum-manager kvantum-qt5 kvantum-qt6

## GTK Theming: nwg-look

## Hyprland plugins

To install plugins, just follow: https://wiki.hyprland.org/Plugins/Using-Plugins/

I had problem with version 0.48.1 of Hyprland, I wansn't able to compile plugins, there is two reasons:
- First when running hyprpm add https://github.com/hyprwm/hyprland-plugins, it's mandatory to add the git rev v0.48.0 at the end of the command, otherwise it will not work
- Second, it's needed to install the hundred of necessary *-devel packages using OpenSUSE zypper

## Fonts

- JetBrains Mono Nerd Font
- Symbols Nerd Font
- Rubik

NerdFont
1. Go to Nerd Fonts website
2. Download the zip file and extract it
3. For global installation, copy all .ttf files to /usr/share/fonts/xxx/ folder

## Starship

To add a prompt style to the terminal

There is also oh-my-posh for example

## Config templates

- https://github.com/end-4/dots-hyprland/tree/main

## Useful links

- https://arewewaylandyet.com/
- https://github.com/Aylur/ags
- https://github.com/elkowar/eww
- https://store.kde.org/browse
- https://www.gnome-look.org/browse/
- https://github.com/hyprland-community/awesome-hyprland

