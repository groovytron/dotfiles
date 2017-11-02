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

# Vagrant
export VAGRANT_DEFAULT_PROVIDER=libvirt

# Android
export ANDROID_SDK_ROOT=$HOME/Android/Sdk
