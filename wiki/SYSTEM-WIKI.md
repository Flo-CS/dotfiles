# System Wiki

## Backup

It's very important to have a backup tool, because if a mistake is made, it can be a real pain to fix it

There is:

- Timeshift
- Snapper (created and by default in OpenSUSE)

## Sound

### Pipewire

Pipewire is a multimedia server that aims to be a drop-in replacement for PulseAudio and JACK.
It seems to be installed by default in OpenSUSE Tumbleweed.

## NVIDIA

Installing nvidia drivers is a pain.

Following the official OpenSUSE documentation is a good start: [https://en.opensuse.org/SDB:NVIDIA_drivers]

See the ISSUE.md file for more information about the NVIDIA drivers installation.

prime-select is not installed by default, but it can be useful to switch between integrated graphics and NVIDIA GPU.

- [https://en.opensuse.org/SDB:NVIDIA_drivers]
- [https://en.opensuse.org/SDB:NVIDIA_the_hard_way]

## Hyprland

Hyprland is an implementation of the Wayland protocol, which is the successor of the old X11 protocol.

## Hyprland plugins

To install plugins, just follow: [https://wiki.hyprland.org/Plugins/Using-Plugins/]

## QT Theming: Kvantum

Kvantum is an alternative tool to qt5ct or qt6ct to customize QT applications theme.

Env variables should be set to instruct QT applications to use Kvantum:

```bash
QT_QPA_PLATFORM=wayland
QT_QPA_PLATFORMTHEME=qt6ct
QT_STYLE_OVERRIDE=Kvantum
```

## GTK Theming: nwg-look

nwg-look is a tool to customize GTK applications theme.

NOTE: Only works with GTK 3 ?

## Install fonts

For global installation, copy all .ttf files to /usr/share/fonts/xxx/ folder
