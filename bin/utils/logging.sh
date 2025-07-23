#!/usr/bin/env bash

# Color functions
color_reset="\033[0m"
color_info="\033[1;34m"    # Bold Blue
color_success="\033[1;32m" # Bold Green
color_warn="\033[1;33m"    # Bold Yellow
color_error="\033[1;31m"   # Bold Red

log_info() { echo -e "${color_info}info: ${color_reset} $*"; }
log_warn() { echo -e "${color_warn}warning: ${color_reset} $*"; }
log_error() { echo -e "${color_error}error: ${color_reset} $*"; }
log_success() { echo -e "${color_success}success: ${color_reset} $*"; }

section() {
	echo -e "\n${color_info}===== [ $* ] =====${color_reset}\n"
}
