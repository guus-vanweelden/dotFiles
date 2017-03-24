function swagger
  docker run --rm -it -v $HOME:$HOME -w (pwd) quay.io/goswagger/swagger $argv
end
