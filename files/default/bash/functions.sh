# Find files and directories with fzf preview
f() {
	local starting_dir="${1:-.}"

	local file=$(fd -H . "$starting_dir" | fzf \
		--style full \
		--height 60% \
		--reverse \
		--preview "if [ -d {} ]; then tree -C {} 2>/dev/null || ls -la {}; else bat --style=numbers --color=always {} 2>/dev/null || cat {}; fi" \
		--preview-window=right:60%)

	if [ -n "$file" ]; then
		echo "$file"
		return 0
	else
		return 1
	fi
}

# Find directories only
fzfd() {
	local starting_dir="${1:-.}"

	local dir=$(fd --type d -H . "$starting_dir" | fzf \
		--style full \
		--height 60% \
		--reverse \
		--preview "tree -C {} 2>/dev/null || ls -la {}" \
		--preview-window=right:60%)

	if [ -n "$dir" ]; then
		echo "$dir"
		return 0
	else
		return 1
	fi
}

# Find files only
fzff() {
	local starting_dir="${1:-.}"

	local file=$(fd --type f -H . "$starting_dir" | fzf \
		--style full \
		--height 60% \
		--reverse \
		--preview "bat --style=numbers --color=always {} 2>/dev/null || cat {}" \
		--preview-window=right:60%)

	if [ -n "$file" ]; then
		echo "$file"
		return 0
	else
		return 1
	fi
}

# Ripgrep with fzf for content search
# TODO: behavior is not very user friendly
rgf() {
	local query="$1"

	if [ -z "$query" ]; then
		query=$(gum input --placeholder "Enter search query")
		if [ -z "$query" ]; then
			echo "No query provided."
			return 1
		fi
	fi

	local result=$(rg --line-number --no-heading --color=always --smart-case --hidden "$query" |
		fzf --ansi \
			--style full \
			--height 60% \
			--reverse \
			--delimiter : \
			--preview "bat --color=always --highlight-line {2} {1} 2>/dev/null || cat {1}" \
			--preview-window=right:60%)

	if [ -n "$result" ]; then
		local file_path=$(echo "$result" | cut -d: -f1)
		local line_number=$(echo "$result" | cut -d: -f2)
		nvim +$line_number "$file_path"
		return 0
	else
		return 1
	fi
}

# Change directory using fzf
cdf() {
	local dir
	dir=$(fzfd "$1")
	if [ -n "$dir" ]; then
		cd "$dir"
	fi
}

# View file with bat using fzf
batf() {
	local file
	file=$(fzff "$1")
	if [ -n "$file" ]; then
		bat "$file"
	fi
}

# Open file with nvim using fzf
nvf() {
	local file
	file=$(f "$1")
	if [ -d "$file" ]; then
		local before=$(pwd)
		cd "$file"
		nvim .
		cd "$before"
		return
	elif [ -n "$file" ]; then
		nvim "$file"
	fi
}

reboot_to_windows() {
	windows_title=$(sudo grep -i windows /boot/grub/grub.cfg | cut -d "'" -f 2)
	sudo grub-reboot "$windows_title" && sudo reboot
}
