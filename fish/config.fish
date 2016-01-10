# Path to Oh My Fish install.
set -gx OMF_PATH $HOME/.local/share/omf

# Customize Oh My Fish configuration path.
#set -gx OMF_CONFIG "/home/guus_vanweelden/.config/omf"

# Load oh-my-fish configuration.
source $OMF_PATH/init.fish

# Custom plugins and themes may be added to ~/.oh-my-fish/custom
# Plugins and themes can be found at https://github.com/oh-my-fish/
Theme 'robbyrussell'
Plugin 'theme'

set -x GOPATH $HOME/go
set -x PATH $PATH /usr/local/go/bin 
set -x PATH $PATH $HOME/go/bin

set -x LANGUAGE en_US.UTF-8
set -x LANG en_US.UTF-8
