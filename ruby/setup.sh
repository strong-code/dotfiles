#!/bin/sh

echo Installing Ruby stable from RVM...
\curl -sSL https://get.rvm.io | bash -s stable --ruby

echo Done! Loading RVM script now...
source /Users/chl/.rvm/scripts/rvm

echo Done! RVM is ready to use!
