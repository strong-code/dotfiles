# Source .bashrc on login shells
if [ -f ~/.bashrc ]; then . ~/.bashrc; fi

# Export ~/.profile for RVM assistance
if [ -f ~/.profile ]; then . ~/.profile; fi

# Additional exports
# MongoDB path
export MONGO_PATH=/usr/local/mongodb
# PATH export
export PATH=$PATH:$MONGO_PATH/bin:/Applications/Postgres.app/Contents/Versions/9.4/bin
# default cli editor
export EDITOR=vim


# Colors
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

# Prompt settings
export PS1="$C_BPURPLE\u @ \w$C_BCYAN$C_BOLD ⤳  $C_DEFAULT"

# Colorize grep always
export GREP_OPTIONS='--color=auto'

# refresh shell
alias reload="source ~/.bash_profile"

# Some handy aliases for common bash tasks
alias ls="ls -FlAhp" # Better ls display
alias c="clear" # Simpler than ctrl+l / clear

# Directory navigation shortcuts
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias code="cd ~/Documents/code/" # Shortcut to main 'code' dir
alias desk="cd ~/Desktop" # Shortcut to desktop

# Get public-facing IP
alias ip='curl ipecho.net/plain ; echo'

# Open Postgres prompt, assuming it is installed in default place
alias psql="'/Applications/Postgres.app/Contents/Versions/9.4/bin'/psql -p5432"

# Make a directory and cd to it
function mkcd {
  mkdir -p "$1" && cd "$1"
}

# Print file name, info and bytesize
function info {
  file $1
  wc -c $1
}

# Git aliases
alias ga="git add -A"
alias gs="git status -sb"
alias gc="git commit -m"
alias gp="git push"
alias gpu="git pull"
alias gpo="git push origin"
alias gd="git diff"
alias gwd="git diff --word-diff"
alias gb="git branch"
alias gch="git checkout"
alias gst="git stash"
alias gstp="git stash pop"
alias gstc="git stash clear"

# Set upstream to origin/whatever
function gsut {
  git branch --set-upstream-to=origin/$1 $1
}

# easy alias for git stash show, where arg $1 is the stash number
function gsts {
  git stash show stash@{$1}
}

# Ruby related aliases
alias ri="rake install"

# Upload piped input to ix.io and copy resulting URL to clipboard
# ex: `cat my_image.png | pbcopy`
alias paste="curl -s -F 'f:1=<-' ix.io | pbcopy"

# Easy alias for re-attaching to screen sessions (mainly for when im ssh'd into my server)
alias srd="screen -rd"

# Log in to server and start irssi in one command
alias irc="echo -ne \"\033]0;IRC\007\" && clear && ssh -t chl 'screen -d -r irc; bash -l'"

# Second irssi login for :^) reasons
alias sicp="echo -ne \"\033]0;SICP\007\" && clear && ssh -t chl 'screen -d -r sicp; bash -l'"

alias deploy="git checkout master && git pull && whenever -w"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
