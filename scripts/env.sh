#!/bin/bash
#TODO - populate from config

DIR="$(dirname ${BASH_SOURCE[0]})";
export PATH=$PATH":$DIR"
export GOPATH=~/go

source $DIR/gen_env.sh
source $DIR/lyft_env.sh