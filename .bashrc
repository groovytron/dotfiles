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


# PS1="\\[\\e[1m\\]\\u@\\h:\\[\\e[38;5;27m\\]\\W \\[\\e[0m\\]\\[\\e[38;5;15m\\]\$git_branch\\[$txtred\\]\$git_dirty\\[$txtrst\\]\$ "
# export PS1="\[\033[38;5;22m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\] at \[$(tput sgr0)\]\[\033[38;5;226m\]\h\[$(tput sgr0)\]\[\033[38;5;15m\] in \[$(tput sgr0)\]\[\033[38;5;196m\]\w\[$(tput sgr0)\]\\[\\e[38;5;15m\\]\$git_branch\\[$txtred\\]\$git_dirty\\[$txtrst\\] "
export PS1="\[$(printf "\x1b[38;2;78;191;34m\]%s\[\x1b[0m" "\u")\] at \[$(printf "\x1b[38;2;202;160;55m\]\h\[\x1b[0m")\] in \[$(printf "\x1b[38;2;221;60;105m\]\w\[\x1b[0m")\]\\[\\e[38;5;15m\\] \$git_branch\\[$txtred\\]\$git_dirty\\[$txtrst\\] \[$(printf "\x1b[38;2;185;84;225m\]$\[\x1b[0m")\] "

# ls result color customization
export LS_OPTIONS='--color=auto'
alias ls='ls $LS_OPTIONS'
# eval "$(dircolors ~/dircolors.256dark)"

shopt -s checkwinsize # Fix bash resize issue

# Terminal notifications
source /etc/profile.d/undistract-me.sh

# Import functions
FUNK=$HOME/groovy_functions.sh

[[ -f "$FUNK" ]] && source "$FUNK" || echo "Could not find functions file :-("

load_groovy_variables

show_groovy_banner
