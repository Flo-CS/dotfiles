alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

# GENERAL FUNCTIONS

# Find files and directories with fzf preview
function f {
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
function fzfd {
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
function fzff {
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
function rgf {
    local search_term="$1"
    local query="${search_term:-.}"

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
function cdf {
    local dir
    dir=$(fzfd "$1")
    if [ -n "$dir" ]; then
        cd "$dir"
    fi
}

# View file with bat using fzf
function batf {
    local file
    file=$(fzff "$1")
    if [ -n "$file" ]; then
        bat "$file"
    fi
}

# Open file with nvim using fzf
function nvf {
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

# ALIASES
alias lsa='ls --color=auto -la --group-directories-first'
alias shutdown='systemctl poweroff'

# VIM ALIASES
alias vi='nvim'
alias nv='nvim'

# GIT ALIASES
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias gd="git diff"

# SHELL INTEGRATIONS
if command -v starship &>/dev/null; then
    eval "$(starship init bash)"
fi

if command -v zoxide &>/dev/null; then
    eval "$(zoxide init bash)"
fi

reboot_to_windows() {
    windows_title=$(grep -i windows /boot/grub/grub.cfg | cut -d "'" -f 2)
    sudo grub-reboot "$windows_title" && sudo reboot
}
alias reboot-to-windows='reboot_to_windows'

source $DOTS_DIR/themes/current/fzf.sh
source $DOTS_DIR/themes/current/gum.sh
