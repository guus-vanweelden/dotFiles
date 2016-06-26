function aevim
  set OLD_GOROOT $GOROOT
  set -gx GOROOT (goapp env GOROOT)
  vim $argv 
  set -gx GOROOT $OLD_GOROOT
end
