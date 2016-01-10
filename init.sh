#!/bin/bash -xe

# init guus dev instance
# tested on ubuntu 15.10

# update & upgrade (ubuntu)
sudo apt-get update
sudo apt-get -y dist-upgrade
sudo apt-get -y install git git-svn subversion mercurial vim-nox build-essential

mkdir -p ~/dev
cd ~/dev

# build and install tmux
git clone https://github.com/tmux/tmux.git
cd ~/dev/tmux/
sudo apt-get -y install libncurses-dev pkg-config gcc libevent-dev autoconf
autoreconf -i --force && ./configure
sudo make install
cd ~/dev/

# build and install fish-shell
git clone https://github.com/fish-shell/fish-shell.git
cd ~/dev/fish-shell/
autoconf
./configure
make
sudo make install

# install vim extensions
cd ~
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh > install.sh
sh ./install.sh

# install go1.5.2
mkdir -p ~/go
cd /tmp/
wget https://storage.googleapis.com/golang/go1.5.2.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.5.2.linux-amd64.tar.gz

# get dotFiles & link them
cd ~/dev
git clone https://gitlab.com/g.van.weelden/dotFiles.git
ln -s ~/dev/dotFiles/git/gitconfig ~/.gitconfig
rm -rf ~/.config/fish/
ln -s ~/dev/dotFiles/fish .config/fish
git remote set-url origin git@gitlab.com:g.van.weelden/dotFiles.git
