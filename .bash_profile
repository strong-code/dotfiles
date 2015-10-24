# Colors
C_BLUE="\[\033[34m\]"
C_LIGHTBLUE="\[\033[1;34m\]"
C_DEFAULT="\[\033[m\]"
C_BLACK="\[\033[30m\]"
C_BOLD="\[\033[1m\]"

# Prompt settings
export PS1="\u @ \w$C_BOLD ⤳ $C_DEFAULT "

# Colorize grep always
export GREP_OPTIONS='--color=auto'

# Export ~/.profile for RVM assistance
source ~/.profile

# Some handy aliases for common bash tasks
alias ls="ls -FGlAhp" # Better ls display
alias c="clear" # Simpler than ctrl+l / clear
alias .2="cd ../../" # Go up 2 levels
alias .3="cd ../../../" # Go up 3 levels
alias ~="cd ~" # Go home, where you belong
alias code="cd ~/Documents/code/" # Shortcut to main 'code' dir
alias desk="cd ~/Desktop" # Shortcut to desktop

# Make a directory and cd to it
function mkcd {
  mkdir -p "$1" && cd "$1"
}

# Git aliases
alias ga="git add -A"
alias gs="git status -sb"
alias gc="git commit"
alias gp="git push"
alias gpom="git push origin master"
alias gd="git diff"
alias gwd="git diff --word-diff"

# Ruby related aliases
alias ri="rake install"

# Upload piped input to ix.io and copy resulting URL to clipboard
# ex: `cat my_image.png | pbcopy`
alias paste="curl -s -F 'f:1=<-' ix.io | pbcopy"

# Easy alias for re-attaching to screen sessions (mainly for when im ssh'd into my server)
alias srd="screen -rd"

# Log in to server and start irssi in one command
alias irc="ssh -t chl 'screen -d -r irc; bash -l'"

# Second irssi login for :^) reasons
alias sicp="ssh -t chl 'screen -d -r sicp; bash-l'"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
