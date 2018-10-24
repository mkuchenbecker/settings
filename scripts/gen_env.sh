#!/bin/bash
RED='\033[0;31m'
BLUE='\033[0;34m'
GREEN='\033[0;32m'

NC='\033[0m'
echo_red(){
    echo -e "${RED}$1${NC}"
}

echo_blue(){
    echo -e "${BLUE}$1${NC}"
}

PS1="\w$ "

gitsmash() {
    git add .
    if [ -n "$1" ] 
    then
        git commit -m "$1"
    else
        git commit -m "Git Smash"
    fi
    git push origin head
}

dpiscale() {
    gsettings set org.gnome.desktop.interface text-scaling-factor $1
}

export GITSMASHHELP="${RED}smashgit <comment>${NC} adds all files to the git repo, comments and pushes to head."
echo -e $GITSMASHHELP
