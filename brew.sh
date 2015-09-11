#!/bin/sh

echo Installing San Francisco system font...
ruby -e "$(curl -fsSL https://raw.github.com/supermarin/YosemiteSanFranciscoFont/master/install)"

echo Done! Installing Homebrew...
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

# Make sure we’re using the latest Homebrew.
echo Updating brew...
brew update

# Upgrade any already-installed formulae.
echo Done! Upgrading existing applications and utilities...
brew upgrade --all

# Install basic utilities
echo Done! Installing basic utilities...
brew install postgresql

# Install basic apps
echo Done! Installing applications...
brew cask install --appdir="/Applications" google-chrome
brew cask install --appdir="/Applications" skype
brew cask install --appdir="/Applications" spotify
brew cask install --appdir="/Applications" lastfm

# Install development apps
echo Done! Installing development applications...
brew cask install --appdir="/Applications" github
brew cask install --appdir="/Applications" atom

# Clean up
echo Done! Cleaning up...
brew cleanup --force
rm -f -r /Library/Caches/Homebrew/*
echo Done! Installation of Homebrew applications complete!
echo Remember to install Evernote from the App Store!
