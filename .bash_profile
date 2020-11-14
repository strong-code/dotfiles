# Ignore ctrl+s stopping input
stty -ixon

BASH_SRC_PATH=~/Documents/code/dotfiles/bash

if [ -f ~/.bashrc ]; then . ~/.bashrc; fi
if [ -f ~/.chl ]; then . ~/.chl; fi

# Check if anything gets accidentally added to ~/.profile.
if [ -s ~/.profile ]; then
  echo "WARNING! Something was added to ~/.profile when it should be in dotfiles:"
  cat ~/.profile
fi

. "$BASH_SRC_PATH"/.aliases
. "$BASH_SRC_PATH"/.profile
. "$BASH_SRC_PATH"/.functions
. ~/.git-prompt.sh

# Show special SSH prompt
if [ -n "$SSH_CONNECTION" ]; then
  export PS1="$C_RED[$HOSTNAME]$C_BLUE \u @ \w$C_DEFAULT$C_BOLD\$(__git_ps1)$C_BLUE ⤳  $C_DEFAULT"
else # normal shell prompt
  export PS1="$C_BLUE\u @ \w$C_DEFAULT$C_BOLD\$(__git_ps1)$C_BLUE ⤳  $C_DEFAULT"
fi
