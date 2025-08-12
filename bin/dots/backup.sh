#!/usr/bin/env bash

backup() {
	if gum confirm "Do you want to create a system backup snapshot?"; then
		local snapshot_description=$(gum input --placeholder "Snapshot description")
		if ! sudo snapper -c root create --description "$snapshot_description" -u important=yes; then
			echo "Warning: Snapshot creation failed" >&2
		else
			log_info "System backup snapshot created successfully"
		fi
	else
		log_info "Skipping system backup snapshot creation"
	fi
}

case "$1" in
backup)
	backup
	;;
esac
