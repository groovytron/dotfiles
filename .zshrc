# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# tmux
export TMUX_POWERLINE_SYMBOLS="powerline"

# solarized dircolors
eval `dircolors ~/dircolors.256dark`

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
)

source $ZSH/oh-my-zsh.sh

# Load environment variables (Vagrant, Android & Cie)
VARS_FILE=$HOME/shared-vars.sh

if [ -f $VARS_FILE ]; then
    source $VARS_FILE
fi

# Load banner at terminal start
BANNER_FILE=$HOME/banner.sh

if [ -f $BANNER_FILE ]; then
    source $BANNER_FILE
fi

# Fix home and end keybinding issue
bindkey "${terminfo[khome]}" beginning-of-line
bindkey "${terminfo[kend]}" end-of-line
