#!/bin/sh

# Install Xcode Command Line Tools for git
touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress
PROD=$(softwareupdate -l | grep "\*.*Command Line" | head -n 1 | awk -F"*" '{print $2}' | sed -e 's/^ *//' | tr -d '\n')
softwareupdate -i "$PROD" -v

echo "XCode CommandLineTools installed. Pulling git repo now"

mkdir -p ~/Documents/code
cd ~/Documents/code
git clone https://github.com/strong-code/dotfiles.git
cd dotfiles
sudo gem install rake

if [ $1 = "all" ]; then
  echo "Installing all modules"
  rake install[all]
else
  rake install
fi
