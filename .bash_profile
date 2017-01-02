##
# Additional exports
##

# Source .bashrc on login shells
if [ -f ~/.bashrc ]; then . ~/.bashrc; fi
# Export credentials file
if [ -f ~/.chl ]; then . ~/.chl; fi
# Source git-prompt script
source ~/.git-prompt.sh
export GIT_PS1_SHOWSTASHSTATE=1 # Shows indicator if branch contains stashes
export GIT_PS1_SHOWDIRTYSTATE=1 # Shows indicator if branch is in dirty state

# default cli editor
export EDITOR=vim

# Don't log history if command begins with space
export HISTIGNORE="[ \t]*"

# Android/Java paths
export ANDROID_HOME=/Users/chl/Downloads/android-sdk-macosx
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_91.jdk/Contents/Home

##
# Colors
##

export TERM=xterm-256color
C_BLUE="\[\033[34m\]"
C_LIGHTBLUE="\[\033[1;34m\]"
C_BOLDBLUE="\[\e[1;34m\]"
C_DEFAULT="\[\033[m\]"
C_BLACK="\[\033[30m\]"
C_BOLD="\[\033[1m\]"
C_BCYAN="\[\e[1;96m\]"
C_BBLACK="\[\e[1;90m\]"
C_BGREEN="\[\e[1;92m\]"
C_BPURPLE="\[\e[1;95m\]"
C_PURPLE="\[\e[0;35m\]"

# Colorize grep always
export GREP_OPTIONS='--color=auto'

##
# Prompt settings.
##

# Show special SSH prompt
if [ -n "$SSH_CONNECTION" ]; then
  export PS1="$C_BCYAN[SSH] \u @ \w$C_BPURPLE$C_BOLD\$(__git_ps1) ⤳  $C_DEFAULT"
else # normal shell prompt
  export PS1="$C_BPURPLE\u @ \w$C_BCYAN$C_BOLD\$(__git_ps1) ⤳  $C_DEFAULT"
fi

##
# Directory navigation
##

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias code="cd ~/Documents/code/" # Shortcut to main 'code' dir
alias desk="cd ~/Desktop" # Shortcut to desktop

# Make a directory and cd to it
mkcd () {
  mkdir -p "$1" && cd "$1"
}

# Print file name, info and bytesize
info () {
  file "$1"
  wc -c "$1"
}

# Print absolute path given a filename
fp () {
  case "$1" in
    /*) printf '%s\n' "$1";;
    *) printf '%s\n' "$PWD/$1";;
  esac
}

##
# Git
##

alias ga="git add -A"
alias gs="git status -sb"
alias gc="git commit -m"
alias gp="git pull"
alias gpo="git push origin"
alias gd="git diff"
alias gdc="git diff --cached"
alias gwd="git diff --word-diff"
alias gb="git branch"
alias gch="git checkout"
alias gst="git stash"
alias gstp="git stash pop"
alias gstc="git stash clear"
alias gstls="git stash list"

# Push to current branch with remote origin
gpc () {
  branch=$(git rev-parse --abbrev-ref HEAD)
  git push origin $branch
}

# Set upstream to origin/whatever
gsut () {
  git branch --set-upstream-to=origin/"$1" "$1"
}

# easy alias for git stash show, where arg $1 is the stash number
# -p flag shows expanded view
gsts () {
  if [ "$1" == "-p" ];
  then
    git stash show -p stash@{"$2"}
  else
    git stash show stash@{"$1"}
  fi
}

##
# Markdown
##

alias eme="open -a eme"

##
# Ruby
##

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

alias ri="rake install"
alias rake="bundle exec rake"

##
# Screen
##

# Easy alias for re-attaching to screen sessions
alias srd="screen -rd"
alias slist="screen -ls"

# Kill screen session by ID or name
skill () {
  screen -S "$1" -X quit
}

##
# Irssi/IRC
##

# Log in to server and start irssi named screen session with named terminal tab
alias irc="echo -ne \"\033]0;IRC\007\" && clear && ssh -x -t chl 'screen -d -r irc; bash -l'"

# Second irssi login for :^) reasons
alias sicp="echo -ne \"\033]0;SICP\007\" && clear && ssh -x -t chl 'screen -d -r sicp; bash -l'"

##
# Misc aliases/functions
##

alias ls="ls -FlAhp"
alias c="clear"
alias reload="source ~/.bash_profile"

# Upload piped input to ix.io and copy resulting URL to clipboard

# If we're not on osx, alias paste to xclip utlity
if [ "$(uname)" == "Darwin" ]; then
  paste() {
    curl -s -F media=@"$1" -H "Authorization: Token token=$STRONGCODE_API_KEY" http://strongco.de/media | tee /dev/tty | pbcopy
  }
elif [ "$(uname)" == "Linux" ]; then
  paste() {
    curl -s -F media=@"$1" -H "Authorization: Token token=$STRONGCODE_API_KEY" http://strongco.de/media
  }
fi


# Get public-facing IP
myip () {
  PUB_IP=$(curl -s ipecho.net/plain)
  echo "$PUB_IP"
}

nvm () {
  unset -f nvm
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
  nvm "$@"
}

node () {
  unset -f node
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
  node "$@"
}

npm () {
  unset -f npm
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
  npm "$@"
}

note () {
  if [[ $1 == "-v" ]]; then
    vim -c 'startinsert' ~/.tempnote
    entry=$(cat ~/.tempnote)
    curl -H "Authorization: Token token=$STRONGCODE_API_KEY" -d "journal_entry[text]=$entry" http://strongco.de/journal_entries.json
    rm ~/.tempnote
  else
    curl -H "Authorization: Token token=$STRONGCODE_API_KEY" -d "journal_entry[text]=$1" http://strongco.de/journal_entries.json
  fi
  echo ""
}

# Add chef path export
export PATH=/opt/chefdk/bin:$PATH
# Additional export for rbenv on ubuntu
if [ "$(uname)" == "Linux" ]; then
  export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
fi

# Add miscellaneous scripts to path
export PATH=$PATH:$(code && echo $(pwd))/miscellaneous
