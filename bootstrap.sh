#!/usr/bin/env bash

# Install system requirements


sudo apt-get update
# sudo apt-get upgrade -y

sudo apt-get install -y g++
sudo apt-get install -y nodejs
sudo apt-get install -y ruby ruby-dev
sudo apt-get install -y sqlite3 libsqlite3-dev
sudo gem update

sudo gem install bundler
sudo gem install nokogiri

sudo gem install rails

sudo gem install sqlite3
