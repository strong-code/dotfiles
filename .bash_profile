##
# Additional exports
##

# Source .bashrc on login shells
if [ -f ~/.bashrc ]; then . ~/.bashrc; fi
# Export ~/.profile for RVM assistance
if [ -f ~/.profile ]; then . ~/.profile; fi
# MongoDB path
export MONGO_PATH=/usr/local/mongodb
# PATH export
export PATH=$PATH:$MONGO_PATH/bin:/Applications/Postgres.app/Contents/Versions/9.4/bin
# default cli editor
export EDITOR=vim

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

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Show special SSH prompt
if [ -n "$SSH_CONNECTION" ]; then
  export PS1="$C_BCYAN[SSH] \u @ \w$C_BPURPLE$C_BOLD$(parse_git_branch) ⤳  $C_DEFAULT"
else # normal shell prompt
  export PS1="$C_BPURPLE\u @ \w$C_BCYAN$C_BOLD$(parse_git_branch) ⤳  $C_DEFAULT"
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

##
# Git
##

alias ga="git add -A"
alias gs="git status -sb"
alias gc="git commit -m"
alias gp="git push"
alias gpu="git pull"
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

# Set upstream to origin/whatever
gsut () {
  git branch --set-upstream-to=origin/"$1" "$1"
}

# easy alias for git stash show, where arg $1 is the stash number
gsts () {
  git stash show stash@{"$1"}
}

##
# Ruby
##

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

alias ri="rake install"

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
# ex: `cat my_image.png | pbcopy`
alias paste="curl -s -F 'f:1=<-' ix.io | pbcopy"

# Get public-facing IP
myip () {
  PUB_IP=$(curl -s ipecho.net/plain)
  echo "$PUB_IP"
}

export NVM_DIR="/root/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

cd () {
  builtin cd "$@" && setnvm
}

setnvm () {
  if [ -s $PWD/package.json ]; then
    NODE_VER=$(ruby -e "require 'json'; puts JSON.parse(File.read(ARGV[0]))['engines']['node']" package.json)
    echo "Using node version $NODE_VER found in package.json"
    source ~/.nvm/nvm.sh
    nvm use $NODE_VER
  fi
}
