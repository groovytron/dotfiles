#!/bin/bash

VARS_FILE=$HOME/groovy_variables.sh
BANNER_FILE=$HOME/groovy_banner.sh

# Load environment variables (Vagrant, Android & Cie)
load_groovy_variables() {
    [[ -f "$VARS_FILE" ]] && source "$VARS_FILE" || echo "Variables file not found :-("
}

# Load banner at terminal start
show_groovy_banner() {
    [[ -f "$BANNER_FILE" ]] && source "$BANNER_FILE" || echo "Banner file not found :-("
}

gimme_shrug() {
    printf '¯\_(ツ)_/¯' | xclip -selection clipboard
    echo "Sorry it's in your clipboard now. ¯\\_(ツ)_/¯"
}
