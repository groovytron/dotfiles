#!/bin/bash

# Text editor
export VISUAL=vim
export EDITOR="$VISUAL"

# tmux
export TMUX_POWERLINE_SYMBOLS="powerline"

# Composer
export PATH="$PATH:$HOME/.config/composer/vendor/bin"

# Vagrant
# export VAGRANT_DEFAULT_PROVIDER=libvirt

# Android
if [[ $(uname) == 'Darwin' ]]; then
    export ANDROID_HOME=${HOME}/Library/Android/sdk
else
    export ANDROID_HOME=${HOME}/Android/Sdk
fi
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools
export ANDROID_SDK_ROOT=${ANDROID_HOME}

# Ansible
export ANSIBLE_NOCOWS=1

# Zathura
alias zathura='zathura --fork'

# Glow
alias glow='glow --pager'

# Go
export GOPATH=$HOME/go
export PATH=${PATH}:${GOPATH}/bin

# FZF
# Search hidden files (https://www.reddit.com/r/neovim/comments/48ymsn/fzf_how_to_show_hidden_files/d0oji2s)
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -f -g ""'

# Ruby
# export PATH=$HOME/.gem/ruby/2.6.0/bin:$HOME/bin:/usr/local/bin:$PATH

# Tmuxinator
alias mux="tmuxinator"

#.NET Core
export DOTNET_CLI_TELEMETRY_OPTOUT=1

# Bat
export BAT_STYLE='plain'

# Docker
alias docker_nuke='docker system prune -a --volumes'
