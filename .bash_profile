# Colors
C_BLUE="\[\033[34m\]"
C_LIGHTBLUE="\[\033[1;34m\]"
C_DEFAULT="\[\033[m\]"
C_BLACK="\[\033[30m\]"
C_BOLD="\033[1m\]"

# Prompt settings
export PS1="\u @ $C_LIGHTBLUE\w$C_DEFAULT$C_BOLD ⤳ $C_DEFAULT "

# Export ~/.profile for RVM assistance
source ~/.profile

# Some handy aliases for common bash tasks
alias ls="ls -FGlAhp" # Better ls display
alias c="clear" # Simpler than ctrl+l / clear
alias .2="cd ../../" # Go up 2 levels
alias .3="cd ../../../" # Go up 3 levels
alias ~="cd ~" # Go home, where you belong
alias code="cd ~/Documents/code/" # Shortcut to main 'code' dir

# Git aliases
alias ga="git add -A"
alias gs="git status -sb"
alias gc="git commit -m" # commit message required
alias gp="git push"
alias gpom="git push origin master"

# Upload piped input to ix.io and copy resulting URL to clipboard
alias paste="curl -s -F 'f:1=<-' ix.io | pbcopy"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
