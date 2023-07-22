#!/bin/bash

DIR="$(dirname ${BASH_SOURCE[0]})"

export GIT_EDITOR=vim

alias vi=vim
alias ls='ls -l'

reloadenv() {
  source $DIR/env.sh
}
editenv() {
  vi $DIR/env.sh
}
