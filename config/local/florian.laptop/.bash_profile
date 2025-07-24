[[ -f ~/.bashrc ]] && . ~/.bashrc

source ~/.default.profile

if uwsm check may-start; then
	exec uwsm start hyprland.desktop
fi

. "$HOME/.cargo/env"

. "$HOME/.atuin/bin/env"
