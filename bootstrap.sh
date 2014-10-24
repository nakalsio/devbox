#!/usr/bin/env bash

# Installing the latest git and mercurial
sudo add-apt-repository ppa:git-core/ppa
sudo apt-get update
sudo apt-get install -y git
sudo apt-get install -y mercurial

# Installing node.js and npm
sudo apt-get install -y nodejs
sudo apt-get install -y npm

# Installing the latest golang
sudo cp /vagrant/godeb .
./godeb install

# Installing the latest rust
curl -s https://static.rust-lang.org/rustup.sh | sudo sh

# Fixing vim by install vim-nox with scripting languages support. Especially ruby
sudo apt-get remove -y vim-tiny
sudo apt-get install -y vim-nox

# Installing ruby-dev
sudo apt-get install -y ruby-dev

sudo -H -u vagrant bash -c 'cp /vagrant/postinstall.sh ~'
sudo -H -u vagrant bash -c 'chmod 755 ~/postinstall.sh'
sudo -H -u vagrant bash -c '~/postinstall.sh'

echo "==================================="
echo "|                                 |"
echo "|     Your Dev env is ready!!     |"
echo "|                                 |"
echo "==================================="
