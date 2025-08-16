export EDITOR=/usr/bin/nvim

if uwsm check may-start; then
	exec uwsm start hyprland.desktop
fi
