# Lines configured by zsh-newuser-install

HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
setopt extendedglob nomatch
unsetopt autocd beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/mkuchenbecker/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall


source ~/settings/env.sh
