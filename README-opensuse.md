# README 

## Dotfiles

Clone my dotfiles repo and create the necessary symlinks for each configs

Each time creating symlink is necessary for config I added [S]

## Backup tool

Before starting, it's good to install a tool to snapshot/backup in case of mistake, so we can rollback

zypper install snapper

INFO: There is also timeshift, but snapper is created by the OpenSUSE team I think

## Sound

zypper install pipewire wireplumber

INFO: Pipewire is a replacement for the old two pulseaudio + jack audio servers

Without it my output audio system was not detected:

zypper install sof-firmware

INFO: sof-firmware is a collection of open source linux firmwares for commercial hardwares like Intel sound chips

## Codecs

I had problems to run Youtube videos on Firefox, apparently, it's a missing codecs issue:

https://en.opensuse.org/SDB:Installing_codecs_from_Packman_repositories

zypper install opi
opi codecs

WARNING: Should be careful because it uses packman repo (community maintained and well known), but some conflicts can happen with the others repos if I understood correctly

## NVidia drivers

Installing NVidia drivers is important

https://en.opensuse.org/SDB:NVIDIA_drivers

NOTE: Is it useful to install prime-select tools ? (Prime is some kind of technology to switch between integrated graphics and GPU card if I understand correctly)

## Git [S]

zypper install git

Storing Git credentials is way more complicated than I thought, there is some options:
- Github CLI (not working like I want)
- Git Credential Manager (designed for Windows so complicated on Linux)
- Git cache, but each time cache expires we should generate new token, because Github does not allow usage of password to login
- Git plain text, not very secure, even if it's a token

The only simple and secure solution I found is using git-credential-oauth

zypper install git-credential-oauth

INFO: To learn more https://git-scm.com/doc/credential-helpers and https://git-scm.com/docs/gitcredentials

## KeepassXC

zypper install keepassxc

## Hyprland [S]

Hyprland is an implementation of the Wayland protocol, which is the successor of the old X11

=> See the docs for installation

+ There are other things to install (for the most part it's redudant with the Hyprland docs, but easier to find all here):
- a terminal emulator: kitty (default of Hyprland) [S]
- a notification daemon: swaync
- a file manager: thunar
- privilege escalation window: hyprpolkitagent
- XDG Desktop Portal: https://wiki.hyprland.org/Hypr-Ecosystem/xdg-desktop-portal-hyprland/
- some qt supports
    - qt5-wayland ?
    - qt6-wayland 
    - hyprland-qtutils ?
- and:

### App launcher: Wofi [S]

### Wallpaper: Hyprpaper [>S]

### Idle handling: Hypridle [>S]

### Lock screen: Hyprlock [>S]

### Cursor: Hyprcursor [>S]

### Status bar: Waybar [S]

## Nerd Fonts

1. Go to Nerd Fonts website
2. Download the zip file and extract it
3. For global installation, copy all .ttf files to /usr/share/fonts/xxx/ folder

## Starship [S]

To add a prompt style to the terminal

zypper install starship

https://github.com/starship/starship

There is also oh-my-posh for example

## Btop

Resource monitor

zypper install btop

## Fastfetch

Replace of neofetch

zypper install fastfetch

## Fzf

Command line fuzzy finder

zypper install fzf

## Complex scripting

We just need Lua or Python

## Nvim [S]

zypper install neovim
zypper install ripgrep

## Neovide

zypper install neovide

## TODO

https://wiki.hyprland.org/Getting-Started/Master-Tutorial/#themes
