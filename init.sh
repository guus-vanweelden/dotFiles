#!/bin/bash -xe

# init guus dev instance
# tested on ubuntu 15.10

# update & upgrade (ubuntu)
sudo apt-get update
sudo apt-get dist-upgrade
sudo apt-get install git git-svn subvesion mercurial vim-nox

mkdir dev
cd dev

# build and install tmux
git clone git@github.com:tmux/tmux.git
cd ~/dev/tmux/
sudo apt-get install libncurses-dev pkg-config gcc libevent-dev 
autoreconf -i --force && ./configure
sudo make install
cd ~/dev/

# build and install fish-shell
git clone git://github.com/fish-shell/fish-shell.git
cd ~/dev/fish-shell/
autoconf
./configure
make
sudo make install

# get dotFiles & link them

# install vim extensions
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh > install.sh
sh ./install.sh

# install go1.5.2
cd /tmp/
wget https://storage.googleapis.com/golang/go1.5.2.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.5.2.linux-amd64.tar.gz
git clone https://gitlab.com/g.van.weelden/dotFiles.git
