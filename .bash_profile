#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# Load environment variables (Vagrant, Android & Cie)
VARS_FILE=$HOME/shared-vars.sh

if [ -f $VARS_FILE ]; then
    source $VARS_FIlE
fi
