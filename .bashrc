#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

COLORTERM=truecolor

export GITAWAREPROMPT=~/.bash/git-aware-prompt
source "${GITAWAREPROMPT}/main.sh"
export PATH="$PATH:$HOME/.config/composer/vendor/bin"

export LS_OPTIONS='--color=auto'
alias ls='ls $LS_OPTIONS'

PS1="\[\e[1m\]\u@\h:\[\e[38;5;27m\]\W \[\e[0m\]\[\e[38;5;15m\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "

shopt -s checkwinsize

export VISUAL=vim
export EDITOR="$VISUAL"

# tmux
export TMUX_POWERLINE_SYMBOLS="powerline"

# Load environment variables (Vagrant, Android & Cie)
VARS_FILE=$HOME/shared-vars.sh

if [ -f $VARS_FILE ]; then
    source $VARS_FIlE
fi

# Load banner at terminal start
BANNER_FILE=$HOME/banner.sh

if [ -f $BANNER_FILE ]; then
    source $BANNER_FILE
fi
