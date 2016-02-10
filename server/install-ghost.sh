#!/bin/bash

echo "Setting up Ghost directory structure..."
mkdir -p /var/www/
cd /var/www/

echo "Finished! Downloading Ghost now..."
wget https://ghost.org/zip/ghost-latest.zip

echo "Finished! Unzipping..."
unzip -d ghost ghost-latest.zip
cd ghost/

echo "Finished! Installing production now"
npm install --production
echo "Finished! You can set up the config file according to Step 3 at: https://www.digitalocean.com/community/tutorials/how-to-create-a-blog-with-ghost-and-nginx-on-ubuntu-14-04"
