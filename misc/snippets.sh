# Helpful commands or snippets that would be nice to copy/paste

##
# IRC
##

# Set up named screen, with colors
screen -T screen-256color -S irc irssi

# Set up named screen, with colors, for SICP mode
screen -T screen-256color -S sicp irssi --config=~/code/dotfiles/irssi/sicp_config

# Grep etherpulse job_errors log file for all errors for day from root dir
forDay= date +%Y-%m-%d
grep "$forDay" ./log/job_errors.log
