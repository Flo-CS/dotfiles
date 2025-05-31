# README

## ISO, USB, and Installation

Use Ventoy to create a bootable USB drive allowing to boot multiple ISO files from the same USB drive.

Note that the USB drive can still be used to store files other tha ISO files. Most commonly files to set up the system after installation.
They should be placed in a directory with a file named .ventoyignore.

## OpenSUSE Tumbleweed

1) Install OpenSUSE Tumbleweed
    - Do not modify existing Windows partitions if any
    - With the server preset but
      - remove Yast server utilities
      - add fonts
      - add x11 window system, and only select SDDM display manager
      - block SSH
    - Select graphic mode systemd target
    - Disable autologin
2) Use nmcli or nmtui to connect to internet
3) Make zypper update or zypper dup
4) Install hyprland, alacritty
5) Install xwayland because some apps still need X to work (in the future I want to remove it completly), see XWayland part of this docs for more information
6) Run hyprland one time and close it
7) Update the generated hyprland.conf file to change the keyboard layout, the terminal, the generated message, and screen zoom
8) Install git, git-credential-oauth
9) Download KeepassXC AppImage (because trustworthy), warning it only runs on X for now
10) Download KeepassXC database
11) Authenticate to Github and clone dotfiles
12) Install the dotfiles
13) Run the temporary stupid-install-script-opensuse.sh

### Install NVIDIA Drivers in parallel

```bash
sudo zypper install openSUSE-repos-Tumbleweed-NVIDIA
sudo zypper install-new-recommends --repo repo-non-free
sudo zypper install --auto-agree-with-licenses nvidia-video-G06 nvidia-driver-G06-kmp-default
```

## EndeavourOS

1) Install EndeavourOS
    - Connect to internet with nmtui
    - Use the installer
      - Select correct partitioning settings
      - Select no desktop environment
      - Select grub bootloader
      - Choose btfrs partition type
2) Install nvidia drivers with the EndeavourOS nvidia-installer: `nvidia-inst --closed`
3) Install hyprland, alacritty
4) Run hyprland one time and close it
5) Update the generated hyprland.conf file to change the keyboard layout, the terminal, the generated message, and screen zoom
6) Install git, git-credential-oauth
7) Download KeepassXC AppImage (because trustworthy), warning it only runs on X for now
8) Download KeepassXC database
9) Authenticate to Github and clone dotfiles
10) Install the dotfiles
11) Run the temporary stupid-install-script-archlinux.sh
