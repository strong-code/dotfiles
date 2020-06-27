export EDITOR=vim

# Terminal colors
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
C_YELLOW="\[\e[1;33m\]"
C_RED="\[\e[0;31m\]"

# Don't log history if command begins with space
export HISTIGNORE="[ \t]*"

# Shows indicator if branch contains stashes
export GIT_PS1_SHOWSTASHSTATE=1

# Shows indicator if branch is in dirty state
export GIT_PS1_SHOWDIRTYSTATE=1

# Android/Java paths
export ANDROID_HOME=/Users/chl/Downloads/android-sdk-macosx
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_91.jdk/Contents/Home

# rbenv path
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Additional export for rbenv on ubuntu
if [ "$(uname)" == "Linux" ]; then
  export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
fi

# Add miscellaneous scripts to path
export PATH=$PATH:$(code && echo $(pwd))/miscellaneous

# NVM stuff
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
