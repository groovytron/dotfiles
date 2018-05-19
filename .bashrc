#!/bin/bash
#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Git aware prompt (https://github.com/jimeh/git-aware-prompt)
export GITAWAREPROMPT=$HOME/.bash/git-aware-prompt
GITAWARE_MAIN="$GITAWAREPROMPT/main.sh"

[[ -f "$GITAWARE_MAIN" ]] && source "$GITAWARE_MAIN" || echo "Gitaware prompt not installed :-("


PS1="\\[\\e[1m\\]\\u@\\h:\\[\\e[38;5;27m\\]\\W \\[\\e[0m\\]\\[\\e[38;5;15m\\]\$git_branch\\[$txtred\\]\$git_dirty\\[$txtrst\\]\$ "

# ls result color customization
export LS_OPTIONS='--color=auto'
alias ls='ls $LS_OPTIONS'
eval "$(dircolors ~/dircolors.256dark)"

shopt -s checkwinsize # Fix bash resize issue

# Import functions
FUNK=$HOME/groovy_functions.sh

[[ -f "$FUNK" ]] && source "$FUNK" || echo "Could not find functions file :-("

load_groovy_variables

show_groovy_banner
