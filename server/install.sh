#!/bin/sh
echo "Beginning server install script..."
apt-get install build-essential -y

apt-get update # Refresh package list

echo "Up to date! Installing dependency packages now..."
apt-get install libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev -y
apt-get install tk-dev libgdbm-dev libc6-dev libbz2-dev python-software-properties -y
apt-get install python-pip htop libffi-dev sqlite3 zip wget pip -y

# Download and install NVM, Node and NPM
echo "Finished! Installing NVM, Node.js and NPM..."
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.30.2/install.sh | bash

source ~/.bash_profile
source ~/.profile
source ~/.bash_rc

nvm install 0.12.9
nvm install 4.2

nvm use 0.12.9

apt-get install npm -y

echo "Finished!"
