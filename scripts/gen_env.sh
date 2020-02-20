#!/bin/bash
RED='\033[0;31m'
BLUE='\033[0;34m'
GREEN='\033[0;32m'

NC='\033[0m'
echo_red() {
	echo -e "${RED}$1${NC}"
}

echo_blue() {
	echo -e "${BLUE}$1${NC}"
}

PS1="\w$ "
stty intr ^j

gitsmash() {
	git add .
	if [ -n "$1" ]; then
		git commit -m "$1"
	else
		git commit -m "Git Smash"
	fi
	git push origin HEAD
}

dpiscale() {
	gsettings set org.gnome.desktop.interface text-scaling-factor $1
}

nterm() {
	ORIG=$PS1
	TITLE="\e]2;$1\a"
	PS1=${ORIG}${TITLE}
}

frevert() {
	git checkout master $1
}

export GITSMASHHELP="${RED}smashgit <comment>${NC} adds all files to the git repo, comments and pushes to head."
echo -e $GITSMASHHELP

# get current branch in git repo
function parse_git_branch() {
	BRANCH=$(git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
	if [ ! "${BRANCH}" == "" ]; then
		STAT=$(parse_git_dirty)
		echo "[${BRANCH}${STAT}]"
	else
		echo ""
	fi
}

sshaddhome(){
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
}

# get current status of git repo
function parse_git_dirty() {
	status=$(git status 2>&1 | tee)
	dirty=$(
		echo -n "${status}" 2>/dev/null | grep "modified:" &>/dev/null
		echo "$?"
	)
	untracked=$(
		echo -n "${status}" 2>/dev/null | grep "Untracked files" &>/dev/null
		echo "$?"
	)
	ahead=$(
		echo -n "${status}" 2>/dev/null | grep "Your branch is ahead of" &>/dev/null
		echo "$?"
	)
	newfile=$(
		echo -n "${status}" 2>/dev/null | grep "new file:" &>/dev/null
		echo "$?"
	)
	renamed=$(
		echo -n "${status}" 2>/dev/null | grep "renamed:" &>/dev/null
		echo "$?"
	)
	deleted=$(
		echo -n "${status}" 2>/dev/null | grep "deleted:" &>/dev/null
		echo "$?"
	)
	bits=''
	if [ "${renamed}" == "0" ]; then
		bits=">${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
		bits="*${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="+${bits}"
	fi
	if [ "${untracked}" == "0" ]; then
		bits="?${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="x${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
		bits="!${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		echo " ${bits}"
	else
		echo ""
	fi
}

export PS1="\[\e[36m\]\`parse_git_branch\`\[\e[m\]_[\[\e[35m\]\u\[\e[m\]@\h]\[\e[36m\]\w\[\e[m\]\\$ "

fdiff() {
	echo -e "${RED}fdiff${NC}  git diff --stat --color master"
	git diff --stat --color master
}
echo -e "${RED}fdiff${NC}  git diff --stat --color master"

alias k=kubectl
export VISUAL=vim
export EDITOR="$VISUAL"

export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"


alias kpod="kubectl get pods | grep -oh 'brewery-deployment-.*-\S*'"
kp(){
	export KPOD=$(kpod)
	echo $KPOD
}
