export EDITOR=/usr/bin/nvim
export SYSTEMD_EDITOR=/usr/bin/nvim
export TERMINAL=alacritty
export PATH="$HOME/.local/bin:$PATH"

if uwsm check may-start; then
	exec uwsm start hyprland.desktop
fi
