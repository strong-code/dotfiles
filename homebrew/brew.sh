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

# Install basic utilities
echo Done! Installing irssi IRC client...
brew install irssi

# Install basic apps
echo Done! Installing applications...
brew cask install --appdir="/Applications" google-chrome
brew cask install --appdir="/Applications" skype
brew cask install --appdir="/Applications" spotify
brew cask install --appdir="/Applications" lastfm

# Install development apps
echo Done! Installing development applications...
brew cask install --appdir="/Applications" atom
brew install postgresql
brew install git

# Clean up
echo Done! Cleaning up...
brew cleanup --force
rm -f -r /Library/Caches/Homebrew/*
echo Done! Installation of Homebrew applications complete!
echo Remember to install Evernote from the App Store!
