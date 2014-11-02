#!/usr/bin/env bash

# Installing the latest git and mercurial
su -c 'add-apt-repository ppa:git-core/ppa'
su -c 'apt-get update'
su -c 'apt-get install -y git'
su -c 'apt-get install -y mercurial'

# Installing node.js and npm
su -c 'apt-get install -y nodejs'
su -c 'apt-get install -y npm'

# Installing the latest golang
su -c 'cp /vagrant/godeb .'
su -c 'chmod 755 godeb'
su -c './godeb install'

# Installing the latest rust
curl -s https://static.rust-lang.org/rustup.sh | sudo sh

# Fixing vim by install vim-nox with scripting languages support. Especially ruby
su -c 'apt-get remove -y vim-tiny'
su -c 'apt-get install -y vim-nox'

# Installing ruby-dev
su -c 'apt-get install -y ruby-dev'

# Installing valgrind (Memcheck, a memory error detector)
su -c 'apt-get install -y valgrind'

# Install exuberant-ctags
su -c 'apt-get install -y exuberant-ctags'

# Install comment drawing boxes
su -c 'apt-get install -y boxes'

sudo -H -u vagrant bash -c 'cp /vagrant/postinstall.sh ~'
sudo -H -u vagrant bash -c 'chmod 755 ~/postinstall.sh'
sudo -H -u vagrant bash -c '~/postinstall.sh'

echo "==================================="
echo "|                                 |"
echo "|     Your Dev env is ready!!     |"
echo "|                                 |"
echo "==================================="
