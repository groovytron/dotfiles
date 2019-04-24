#!/bin/bash

VARS_FILE=$HOME/groovy_variables.sh
BANNER_FILE=$HOME/groovy_banner.sh

# Load environment variables (Vagrant, Android & Cie)
load_groovy_variables() {
    # shellcheck source=/dev/null
    [[ -f "$VARS_FILE" ]] && source "$VARS_FILE" || echo "Variables file not found :-("
}

# Load banner at terminal start
show_groovy_banner() {
    # shellcheck source=/dev/null
    [[ -f "$BANNER_FILE" ]] && source "$BANNER_FILE" || echo "Banner file not found :-("
}

# ¯\_(ツ)_/¯
gimme_shrug() {
    printf '¯\_(ツ)_/¯' | xclip -selection clipboard
    echo "Sorry it's in your clipboard now. ¯\\_(ツ)_/¯"
}

# find and replace the specified pattern in all files in the specified folder
sed_nuke() {
    if [ $# -ne 2 ]; then
        echo 'Usage sed_nuke [sed-pattern] [folder]'
        return 1
    fi
    find "$2" -type f -print0 | xargs -0 sed -i "$1"
}

# Clip file content into clipboard
clip_file() {
    if [ $# -ne 1 ]; then
        echo 'Please specify one and only file whose content will be copied to clipboard'
        return 1
    fi
    xclip -selection clipboard < "$1"
}
