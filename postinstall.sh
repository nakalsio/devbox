#!/usr/bin/env bash

# Setting up go env
mkdir -p ~/gocode
touch ~/.bash_profile
echo "export GOPATH=~/gocode" >> ~/.bash_profile

# Installing Vundle and my plugins
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp /vagrant/.vimrc ~
sleep 1
echo "Installing vim plugins. Be patient! -------"
vim +PluginInstall +qall >/dev/null
sleep 5
echo "Installing missing go binary tools. -------"
vim +GoInstallBinaries +qall >/dev/null

# The C extention for Command-T must be built
echo "Build the C extension for Command-T -------"
cd ~/.vim/bundle/command-t/ruby/command-t/
ruby extconf.rb
make