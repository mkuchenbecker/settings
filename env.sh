#!/bin/bash
#TODO - populate from config

DIR="$(dirname ${BASH_SOURCE[0]})"
export PATH=$PATH":$DIR"
export GOPATH=~/go
export PATH=$PATH:/home/mike/.linuxbrew/bin/brew
export PATH=$PATH:/home/linuxbrew/.linuxbrew/opt/go/libexec/bin
export PATH=$PATH:$GOPATH
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/usr/local/go/bin

export GIT_EDITOR=vim

code() { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $*; }

# ln -s "/Applications/Sublime Text 3.app/Contents/SharedSupport/bin/subl" /usr/local/bin/gedit

source $DIR/gen_env.sh
source $DIR/opt_env.sh

alias python=python3
alias pip=pip3


echo -e "${RED}reloadenv${NC}  reloads the env.sh"
reloadenv() {
  source $DIR/env.sh
}