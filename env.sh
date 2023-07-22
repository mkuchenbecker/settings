#!/bin/bash

DIR=~/settings
export GIT_EDITOR=vim

alias vi=vim
alias ls='ls -l'

reloadenv() {
  source $DIR/env.sh
}

editenv() {
  vi $DIR/env.sh
}

fdiff() {
	echo -e "${RED}fdiff${NC}  git diff --stat --color master"
	git diff --stat --color master
}
