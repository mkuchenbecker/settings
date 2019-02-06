#!/bin/bash
#TODO - populate from config

DIR="$(dirname ${BASH_SOURCE[0]})";
export PATH=$PATH":$DIR"
export GOPATH=~/go
export PATH=$PATH:/home/mike/.linuxbrew/bin/brew
export PATH=$PATH:/home/linuxbrew/.linuxbrew/opt/go/libexec/bin
export PATH=$PATH:$GOPATH
export PATH=$PATH:$GOPATH/bin

source $DIR/gen_env.sh
source $DIR/lyft_env.sh
