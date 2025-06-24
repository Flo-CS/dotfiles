#!/usr/bin/env bash

source $DOTFILES_UTILS

section "Sudoers"
create_dotfiles_copy system/sudoers/$DOTFILES_USERNAME /etc/sudoers.d/$DOTFILES_USERNAME

section "GRUB"
# os-prober is disabled by default in grub config and it's better for security reasons. But it is useful to detect other OSes and then add them manually to grub.
windows_boot_partition_path=$(sudo os-prober | grep "Windows Boot Manager" | head -n 1 | cut -d'@' -f1)
info "detected Windows Boot Manager at: $windows_boot_partition_path"
if [[ -n $windows_boot_partition_path ]]; then
	windows_boot_partition_uuid=$(sudo blkid -s UUID -o value "$windows_boot_partition_path" 2>/dev/null)
	if [[ -z $windows_boot_partition_uuid ]]; then
		windows_boot_partition_uuid=$(lsblk -no UUID "$windows_boot_partition_path" 2>/dev/null)
		if [[ -z $windows_boot_partition_uuid ]]; then
			error "unable to retrieve UUID for Windows Boot Manager partition."
			exit 1
		fi
	fi

	info "Windows Boot Manager UUID: $windows_boot_partition_uuid"
	insert_content_with_marker /etc/grub.d/40_custom "windows" "
menuentry 'Windows Boot Manager' --class windows --class os {
    search --fs-uuid --no-floppy --set=root $windows_boot_partition_uuid
    chainloader /EFI/Microsoft/Boot/bootmgfw.efi
}
"
else
	error "no Windows Boot Manager found. Skipping Windows entry in GRUB."
	exit 0
fi
