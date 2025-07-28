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

# Add homebrew /bin path before system /bin on MacOS
if [ "$(uname)" == "Darwin" ]; then
  export PATH=/opt/homebrew/bin:/opts/homebrew/sbin:$PATH
fi

# asdf loading
# Always install from git, not homebrew
# http://asdf-vm.com/guide/getting-started.html#_2-download-asdf
if [ "$(hostname)" == "chl-server" ]; then
  export ASDF_DATA_DIR=/opt/asdf
  export PATH="$ASDF_DATA_DIR/bin:$ASDF_DATA_DIR/shims:$PATH"
else
  export ASDF_DATA_DIR=~/.asdf
fi
. ${ASDF_DATA_DIR}/completions/asdf.bash

# Set tty for gpg signing 
export GPG_TTY=$(tty)
