# Mvp

- Run install/deploy script for a feature
- Run switch theme for an app

- User should be able to store all his configs inside a git repository, even for multiple machines

## Theming/Configuring problematics

- Some apps only have one theme config file and it should be replaced if the theme is changed
- Some apps allow to have multiple themes config files but the theme should be switched inside a main config file

- Some configs are machine specific and the app only have a main config file, so config file should have a machine specific section
- Some configs are machine specific and the app have multiple config files, so machine specific config file should be used inside the main one

## Architecture

- Either have custom config format (+ allow export) or integrate with existing tools like bash

- Git Dotfiles -> Build directory -> Symlink to the correct place
- Why ?

### Custom Config Format hypothesis

Something ~ like Hyprland:
```
my-feature {
  app:zoxide { sudo pacman -S zoxide }
  app:alacritty {
    sudo pacman -S alacritty
    config:alacritty {
      theme: default
      font: FiraCode
    }
  }
}
```

### Cardinalities

- 1 install script can install multiple features
