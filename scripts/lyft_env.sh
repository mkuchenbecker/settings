#!/bin/bash
echo_blue "################################################################################"

export lyft=$GOPATH/src/github.com/lyft/


export ONEBOX_ROOT=onebox.dev.lyft.net
export ONEBOXNAME=mkuchenbecker

export MYONEBOX=$ONEBOXNAME-$ONEBOX_ROOT 
echo -e ${RED}MYONEBOX${NC}:$MYONEBOX

export STASHBOX=stashdblib-legacy-$MYONEBOX
echo -e ${RED}STASHBOX${NC}:$STASHBOX


#################### Commands ####################

scp_env() {
    echo 'Copying ENV to onebox'
    ssh $MYONEBOX 'mkdir env && mkdir vim'
    scp $DIR/env.sh $MYONEBOX:/home/mkuchenbecker/env/env.sh
    scp $DIR/gen_env.sh $MYONEBOX:/home/mkuchenbecker/env/gen_env.sh
    scp $DIR/lyft_env.sh $MYONEBOX:/home/mkuchenbecker/env/lyft_env.sh
    scp $DIR/lyft_env.sh $MYONEBOX:/home/mkuchenbecker/env/lyft_env.sh
    scp ~/.vimrc $MYONEBOX:/home/mkuchenbecker/.vimrc
}
echo -e "${RED}scp_env${NC} Copy env confifig to onebox."

myonebox() {
    ssh -t $MYONEBOX 'onebox_env'
}

echo -e "${RED}myonebox${NC} ssh into "$MYONEBOX" AWS directly into onebox_env"

onesync() {
    $lyft/hacktools/sync-to-onebox-v3.sh $1-legacy-$ONEBOXNAME
}
echo -e "${RED}onesync repo_name${NC} will sync the repo with onebox."

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

echo_blue "################################################################################"