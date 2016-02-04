# Path to Oh My Fish install.
set -gx OMF_PATH $HOME/.local/share/omf

# Customize Oh My Fish configuration path.
#set -gx OMF_CONFIG "/home/guus_vanweelden/.config/omf"

# Load oh-my-fish configuration.
source $OMF_PATH/init.fish

set -x GOPATH $HOME/go
set -x PATH $PATH /usr/local/go/bin 
set -x PATH $PATH /usr/local/go_appengine
set -x PATH $PATH $HOME/go/bin
set -x PATH $PATH $HOME/google-cloud-sdk/bin

set -x LANGUAGE en_US.UTF-8
set -x LANG en_US.UTF-8
