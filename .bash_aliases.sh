#!/bin/sh
alias l='ls -lAh --group-directories-first --color=auto'
alias lsblk='lsblk -o NAME,TYPE,FSTYPE,LABEL,UUID,SIZE,MOUNTPOINT'
alias grep='grep --color=auto'

alias cd..='cd ..'
function cd { if [ "$*" != "" ]; then builtin cd "$@" && clear && l; else builtin cd; fi }
function cdb { if [ $1 -ne 0 ]; then { cd ..; cdb $[$1-1]; }; fi }

alias mkdir='mkdir -pv'
alias rm='rm -I'

alias manf='man --html=firefox'
alias pingu="ping -c 1 google.com"

alias gits="git status"
alias gitl="git log"
alias gitd="git diff"
alias gitb="git branch"
alias gitr="git reflog"
alias gitc="git commit"

alias r="ranger"
