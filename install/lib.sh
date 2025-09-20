version_ge() {
	if [ "$1" = "$2" ]; then
		return 0
	fi

	if [ "$(printf '%s\n' "$1" "$2" | sort -V | head -n1)" != "$1" ]; then
		return 0
	else
		return 1
	fi
}

write_env_var() {
	local key="$1"
	local value="$2"
	local file="$3"

	sed -i "/^$key=/d" "$file"
	echo "$key=$value" >>"$file"
}

install_packages() {
	echo "installing packages: $@"
	sudo pacman -S --noconfirm --needed "$@"
}

remove_packages() {
	echo "uninstalling packages: $@"
	sudo pacman -R --noconfirm "$@"
}

install_yay_packages() {
	echo "installing yay packages: $@"
	yay -S --needed --answerclean None --answerdiff All "$@"
}
