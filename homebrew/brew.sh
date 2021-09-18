#!/bin/bash

# Make sure we’re using the latest Homebrew.
echo Updating brew...
brew update

# Add brew-cask
echo Done! Installing brew-cask...
brew install caskroom/cask/brew-cask

# Upgrade any already-installed formulae.
echo Done! Upgrading existing applications and utilities...
brew upgrade --all

# Install basic apps
echo Done! Installing user applications...
declare -a apps=("firefox" "spotify" "lastfm" "qbitorrent" "vlc" "docker")
for a in ${apps[*]}
do
  brew cask install --appdir="/Applications" $a
done

# Install development apps
echo Done! Installing development applications...
declare -a apps=("postgresql" "git" "jq" "rbenv" "vim" "exa" "vagrant" "ansible")
for a in ${apps[*]}
do
  brew install $a
done

# Clean up
echo Done! Cleaning up...
brew cleanup --force
rm -f -r /Library/Caches/Homebrew/*
echo Done! Installation of Homebrew applications complete!
