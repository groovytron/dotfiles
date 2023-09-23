#!/bin/bash
#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Git aware prompt (https://github.com/jimeh/git-aware-prompt)
export GITAWAREPROMPT=$HOME/.bash/git-aware-prompt
GITAWARE_MAIN="$GITAWAREPROMPT/main.sh"

# shellcheck source=/dev/null
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
UNDISTRACT_ME=/usr/share/undistract-me/undistract-me.sh
[[ -f "$UNDISTRACT_ME" ]] && source $UNDISTRACT_ME

# Import functions
FUNK=$HOME/groovy_functions.sh

# shellcheck source=/dev/null
[[ -f "$FUNK" ]] && source "$FUNK" || echo "Could not find functions file :-("

load_groovy_variables

show_groovy_banner

# shellcheck source=/dev/null
TMUXINATOR_COMPLETIONS = "$HOME/completions/bash/tmuxinator.bash"

[[ -f "$TMUXINATOR_COMPLETIONS" ]] && source "$TMUXINATOR_COMPLETIONS"

# NVM
# [[ -f /usr/share/nvm/init-nvm.sh ]] && source /usr/share/nvm/init-nvm.sh
# 
# export NVM_DIR="$HOME/.nvm"
# 
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
