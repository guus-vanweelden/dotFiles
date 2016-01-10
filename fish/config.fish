# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish

# Path to your custom folder (default path is ~/.oh-my-fish/custom)
#set fish_custom $HOME/dotfiles/oh-my-fish

# Load oh-my-fish configuration.
. $fish_path/oh-my-fish.fish

# Custom plugins and themes may be added to ~/.oh-my-fish/custom
# Plugins and themes can be found at https://github.com/oh-my-fish/
Theme 'robbyrussell'
Plugin 'theme'

set -x GOPATH /home/vanweelden/go
set -x PATH $PATH /usr/local/go/bin 
set -x PATH $PATH /home/vanweelden/go/bin
set -x PATH $PATH /usr/local/go_appengine
set -x PATH $PATH /home/vanweelden/google-cloud-sdk/bin
set -x PATH $PATH /home/vanweelden/dev/python/app_engine
set -x PATH $PATH /home/vanweelden/.local/bin

set -x LANGUAGE en_US.UTF-8
set -x LANG en_US.UTF-8
