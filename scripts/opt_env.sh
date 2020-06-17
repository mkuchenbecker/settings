#!/bin/bash
echo_blue "################################################################################"


#################### Commands ####################

alias k=lyftkube

export lyft=~/go/src/github.com/lyft

# Replace this with your personal name.
export ONEBOXNAME=mkuchenbecker

export ONEBOX_ROOT=onebox.dev.lyft.net

# Full onebox name.
export MYONEBOX=$ONEBOXNAME-$ONEBOX_ROOT

myonebox() {
    if [ -n "$1" ]; then
        ssh -t $MYONEBOX "control enter $1.legacy"
    else
        ssh $MYONEBOX
    fi
}
echo -e "${RED}myonebox${NC} ssh into "$MYONEBOX" AWS directly into onebox_env.\n    ${RED}myonebox repo_name${NC} Enters the repo container directly. "

onesync() {
    $lyft/hacktools/sync-to-onebox-v3.sh $1-legacy-$ONEBOXNAME
}
echo -e "${RED}onesync repo_name${NC} will sync the repo with onebox."




eaws() {
    aws-okta exec zimride-sudo-developer -- $SHELL
}

kenv() {
    KENV=$1
}

kpro() {
    KPROJECT=$1
}
export PATH="$HOME/bin:$PATH"

export GOPROXY='https://athens.ingress.infra.us-east-1.k8s.lyft.net'
export GONOSUMDB='github.com/lyft/*,github.lyft.net/*'
export GO111MODULE='on'
