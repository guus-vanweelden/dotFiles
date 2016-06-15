#!/bin/bash -xe

# init guus dev instance
# tested on ubuntu 15.10

GOVERSION=go1.6.2.linux-amd64

# update & upgrade (ubuntu)
sudo apt-get update
sudo apt-get -y dist-upgrade
sudo apt-get -y install bzr git tig git-svn subversion mercurial vim-nox build-essential exuberant-ctags

mkdir -p ~/bin
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
rm install.sh

# install OhMyFish
curl -L https://github.com/oh-my-fish/oh-my-fish/raw/master/bin/install | fish

cd /tmp/
# install $GOVERSION
mkdir -p ~/go
wget https://storage.googleapis.com/golang/$GOVERSION.tar.gz
sudo tar -C /usr/local -xzf $GOVERSION.tar.gz

#
go get -u -v -x github.com/kardianos/govendor

# install hub (https://github.com/github/hub)
cd ~/dev
git clone https://github.com/github/hub.git
cd hub
./script/build -o ~/bin/hub

# install current google cloud sdk
sudo rm -f /usr/bin/bq
sudo rm -f /usr/bin/gsutil
sudo rm -f /usr/bin/gcloud
curl https://sdk.cloud.google.com | bash


# TODO: add golang App Engine SDK to apt 
## install go_appengine
# wget https://storage.googleapis.com/appengine-sdks/featured/go_appengine_sdk_linux_amd64-1.9.31.zip
# sudo unzip go_appengine_sdk_linux_amd64-1.9.31.zip -d /usr/local/

# get dotFiles & link them
cd ~/dev
git clone https://gitlab.com/g.van.weelden/dotFiles.git

rm -f ~/.gitconfig
ln -s ~/dev/dotFiles/git/gitconfig ~/.gitconfig
rm -rf ~/.config/fish/
ln -s ~/dev/dotFiles/fish ~/.config/fish
rm -f ~/.tmux.conf
ln -s ~/dev/dotFiles/tmux/tmux.conf ~/.tmux.conf
rm -f ~/.vimrc
ln -s ~/dev/dotFiles/vim/vimrc ~/.vimrc
cd dotFiles
git remote set-url origin git@gitlab.com:g.van.weelden/dotFiles.git

## set defaults
# omf install hulk
sudo update-alternatives --config editor
sudo usermod -s `which fish` `whoami`

#
sudo apt-get autoclean
echo "You shoul'd now copy your ssh keys"
wget -qO- https://get.docker.com/ | sh
