BASH_SRC_PATH=~/Documents/code/dotfiles/bash

if [ -f ~/.bashrc ]; then . ~/.bashrc; fi
if [ -f ~/.chl ]; then . ~/.chl; fi

. "$BASH_SRC_PATH"/.aliases
. "$BASH_SRC_PATH"/.profile
. "$BASH_SRC_PATH"/.functions
. ~/.git-prompt.sh

# Show special SSH prompt
if [ -n "$SSH_CONNECTION" ]; then
  export PS1="$C_RED[SSH]$C_BLUE \u @ \w$C_RED\$(__git_ps1) ⤳  $C_DEFAULT"
else # normal shell prompt
  export PS1="$C_BLUE\u @ \w$C_RED\$(__git_ps1) ⤳  $C_DEFAULT"
fi
