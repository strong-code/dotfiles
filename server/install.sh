#!/bin/sh
apt-get update # Refresh package list
apt-get install build-essential -y

apt-get install libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev -y
apt-get install tk-dev libgdbm-dev libc6-dev libbz2-dev -y
apt-get install python-pip htop fail2ban libffi-dev -y
