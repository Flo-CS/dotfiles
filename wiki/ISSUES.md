# Issues Solver

## No sound

Try to install the sof-firmware package. sof-firmware is a collection of open source linux firmwares for commercial hardwares like Intel sound chips

## Unable to compile Hyprland plugins

I had problem with version 0.48.1 of Hyprland, I wansn't able to compile plugins, there is two reasons:

First, when running `hyprpm add https://github.com/hyprwm/hyprland-plugins`, perhaps the plugins are not compatible with the current version of Hyprland,
so you need to specify a git rev, for example `hyprpm add https://github.com/hyprwm/hyprland-plugins v0.48.0`.

Second, all the *-devel packages for the hyprland dependencies must be installed.

## Black screen just after the grub menu

### Option 1: Monitor issue (FreeSync/HDMI)

Solution 1: use DisplayPort instead of HDMI.
Solution 2: disable FreeSync in the monitor settings and activate the HDMI compatibility mode (if available).
