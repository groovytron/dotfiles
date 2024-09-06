# Import functions
FUNK=$HOME/groovy_functions.sh

[[ -f "$FUNK" ]] && source "$FUNK" || echo "Could not find functions file :-("

load_groovy_variables

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# solarized dircolors
# eval "$(dircolors ~/dircolors.256dark)"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="agnoster"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
git
# notify
# nvm
)

source "$ZSH/oh-my-zsh.sh"

show_groovy_banner

[[ -f /usr/share/undistract-me/long-running.bash ]] \
    && source /usr/share/undistract-me/long-running.bash \
    && notify_when_long_running_commands_finish_install

# shellcheck source=/dev/null
source "$HOME/completions/zsh/tmuxinator.zsh"

# Fix home and end keybinding issue
# bindkey "${terminfo[khome]}" beginning-of-line
# bindkey "${terminfo[kend]}" end-of-line

# gopass zsh completion fix (https://github.com/gopasspw/gopass/issues/585#issuecomment-355416844)

# shellcheck source=/dev/null
# source "$HOME/completions/zsh/gopass.zsh"
# compdef _gopass gopass
# autoload -U compinit && compinit

# Vault
# autoload -U +X bashcompinit && bashcompinit
# complete -o nospace -C /usr/bin/vault vault

# Terraform
# complete -o nospace -C /usr/bin/terraform terraform


# Load Angular CLI autocompletion.
# source <(ng completion script)
source /usr/share/nvm/init-nvm.sh
