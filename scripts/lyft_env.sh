#!/bin/bash
echo_blue "################################################################################"

export lyft=$GOPATH/src/github.com/lyft/

source $DIR/onebox.sh
source $DIR/sync.sh

echo -e ${RED}MYONEBOX${NC}:$MYONEBOX

export STASHBOX=stashdblib-legacy-$MYONEBOX
echo -e ${RED}STASHBOX${NC}:$STASHBOX

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/go/src/github.com/lyft
export VIRTUALENVWRAPPER_PYTHON=`which python3`
source $HOME/.local/bin/virtualenvwrapper.sh

export WORKSPACE=$lyft

export CREDENTIALS_MYSQL_STAGING_PASSWORD=WS7xMhpdMMhLs5zPwj02qfno44Nelia2F
export CREDENTIALS_POSTGRESQL_STAGING_PASSWORD=h5JHzZq8K2UhCAGlIDGUo5T0mgmvnwKjzDq5eKDT2SPnL2rnDa


#################### Commands ####################

scp_env() {
    echo 'Copying ENV to onebox'
    ssh $MYONEBOX 'mkdir env && mkdir vim'
    scp $DIR/env.sh $MYONEBOX:/home/$ONEBOXNAME/env/env.sh
    scp $DIR/gen_env.sh $MYONEBOX:/home/$ONEBOXNAME/env/gen_env.sh
    scp $DIR/lyft_env.sh $MYONEBOX:/home/$ONEBOXNAME/env/lyft_env.sh
    scp $DIR/../vim.vim $MYONEBOX:/home/$ONEBOXNAME/vim/vim.vim
}
echo -e "${RED}scp_env${NC} Copy env confifig to onebox."


myonebox() {
    if [ -n "$1" ]
    then
        ssh -t $MYONEBOX "control enter $1.legacy"
    else
        ssh $MYONEBOX
    fi
}

echo -e "${RED}myonebox${NC} ssh into "$MYONEBOX" AWS directly into onebox_env"

onesync() {
    $lyft/hacktools/sync-to-onebox-v3.sh $1-legacy-$ONEBOXNAME
}
echo -e "${RED}onesync repo_name${NC} will sync the repo with onebox."

mansync() {
    $lyft/hacktools/sync-to-onebox-v3.sh podie-integration-$ONEBOXNAME
}
echo -e "${RED}onesync repo_name${NC} will sync the repo with onebox."

dualsync() {
    $lyft/hacktools/unison-to-onebox-v4.sh $1-$ONEBOXNAME
}


enter() {
    control enter $1.legacy
}
echo -e "${RED}enter repo_name${NC} runs 'control enter repo_name.legacy'"

ensure() {
    #echo "control ensure -g $1.dev"
    control ensure -g $1.dev
}
echo -e "${RED}ensure repo_name${NC} runs 'control ensure -g repo_name.dev'"

fuckglide() {
    echo -e "${RED}fuckglide${NC} glide cc && rm -rf vendor && glide up --strip-vendor"
    glide cc
    rm -rf vendor
    glide up --strip-vendor
}

echo -e "${RED}fuckglide${NC} glide cc && rm -rf vendor && glide up --strip-vendor"

fdiff(){
    echo -e "${RED}fdiff${NC}  git diff --stat --color master"
    git diff --stat --color master
}
echo -e "${RED}fdiff${NC}  git diff --stat --color master"


echo -e $GITSMASHHELP

lyftpip() {
  PIP_CONFIG_FILE="$HOME/.pip/lyft.conf" pip "$@"
  }

showpin() {
    echo "ab1eih8N"
}

svpn() {
    cd ~/.vpn
    echo "ab1eih8N" | xclip -selection c
    ./vpn
}

echo_blue "################################################################################"
