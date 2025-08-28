# README

## About Arch Linux installation

### ISO, USB, and Installation

Use Ventoy to create a bootable USB drive allowing to boot multiple ISO files from the same USB drive.

Note that the USB drive can still be used to store files other tha ISO files. Most commonly files to set up the system after installation.
They should be placed in a directory with a file named .ventoyignore.

### EndeavourOS

1) Install EndeavourOS
    - Connect to internet with nmtui
    - Use the installer
      - Select correct partitioning settings
      - Select no desktop environment
      - Select grub bootloader
      - Choose btfrs partition type
2) Install nvidia drivers with the EndeavourOS nvidia-installer: `nvidia-inst --closed` (IF NECESSARY)
3) Fetch dotfiles
4) Run `init.sh`

## Two options

### 1 - Classic dotfiles

First install:
- Fork repo (for me I will create new branch)
- Run install.sh if it's first time or if you just want to update packages or whatever config

Update:
- Just sync the fork and resolve conflicts if any
- Run again install.sh or config.sh

Advantages:
- Update is customizable, and changes are shown to the user, no migrations overhead
- User is not tied up to a "distro", he can just eject it if he want (is it true ?)

Inconvenients:
- Update may have conflicts

### 2 - "Distro" experience

First install:

Update:

Advantages:
- Installation flow is pretty clear, it just looks like a "distro" installation, like a ready to use system

Inconvenients:
- Update of the copied config folder at first install is not in sync with the "distro" repo. Is it an inconvenient ?
- Migrations can't resolve all divergent changes, for example, in case of a software change (e.g. node.js to bun), we can't just uninstall node.js, what for the users who still want to use it ? Using the first option, at least user can see the changes and choose what to do (?)

## Special thanks

I originally started my dotfiles config by my self, but after some work, I discovered Omarchy and took some inspiration in its architecture and some of its configs to improve mine.
