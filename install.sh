#!/bin/sh

sudo -v

# Keep-alive: update existing `sudo` time stamp until `.osx` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Install envyable to read ENV vars in our rakefile
gem install envyable

# Run rake install to kick off installation
rake install
