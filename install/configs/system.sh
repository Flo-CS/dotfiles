#!/usr/bin/env bash

source $DOTFILES_UTILS

# sudoers
create_dotfiles_copy system/sudoers/$DOTFILES_USERNAME /etc/sudoers.d/$DOTFILES_USERNAME

# grub
# os-prober is disabled by default in grub config and it's better for security reasons. But it is useful to detect other OSes and then add them manually to grub.
windows_boot_partition_path=$(sudo os-prober | grep "Windows Boot Manager" | head -n 1 | cut -d'@' -f1)
echo "Detected Windows Boot Manager at: $windows_boot_partition_path"
if [[ -n $windows_boot_partition_path ]]; then
	windows_boot_partition_uuid=$(blkid -s UUID -o value "$windows_boot_partition_path")
	insert_content_with_marker /etc/grub.d/40_custom "windows" "
menuentry 'Windows Boot Manager' --class windows --class os {
    search --fs-uuid --no-floppy --set=root $windows_boot_partition_uuid
    chainloader (\${root})/efi/Microsoft/Boot/bootmgfw.efi
}
"
else
	echo "No Windows Boot Manager found. Skipping Windows entry in GRUB."
	exit 0
fi
