BLUE='\[\e[0;34m\]'
CYAN='\[\e[0;36m\]'
GREEN='\[\e[0;32m\]'
OFF='\[\e[0m\]'
RED='\[\e[0;31m\]'
YELLOW='\[\e[0;33m\]'

git_branch() {
    git rev-parse --abbrev-ref HEAD 2> /dev/null | sed -e 's/\(.*\)/\1 /'
}

export CLICOLOR=1
export PS1="$CYAN\u $GREEN\h $RED\$(git_branch)$YELLOW\w\n$RED\\$ $OFF"

HISTCONTROL=ignoredups:erasedups
HISTSIZE=10000
HISTFILESIZE=10000

shopt -s histappend
shopt -s checkwinsize

d() { colordiff -ur "$1" "$2"; }
f() { find . -iname "*$1*"; }
g() { grep -RHn --color=auto $2 "$1" *; }
ip() {
    for i in `ifconfig -l | xargs -n1 | sort`
    do
        echo "$i: `ipconfig getifaddr $i || echo None`"
    done
    echo "External: `dig +short myip.opendns.com @resolver1.opendns.com 2> /dev/null || echo None`"
}
goog() { open "http://www.google.com/search?q=$*"; }
ts2date() { date -ur $1 +"%Y-%m-%d %H:%M:%S UTC"; }
run() {
    count=$1
    sleep_s=$2
    shift
    shift
    for i in `seq $count`; do
        $@
        sleep $sleep_s
    done
}

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

alias a='ack'
alias i='cd ~/Library/Mobile\ Documents/com~apple~CloudDocs'
alias l='ls -lahGF'
alias note='vim ~/Library/Mobile\ Documents/com~apple~CloudDocs/Notes.txt'
alias ts='date +%s'

alias ga='git add'
alias gcm='git commit -m'
alias gcam='git commit -am'
alias gd='git diff'
alias gl='git log'
alias glg='git log --graph --oneline'
alias gmv='git mv'
alias gp='git pull'
alias gpuo='git push -u origin'
alias gpuom='git push -u origin master'
alias grm='git rm'
alias gs='git status'
alias gsh='git show'
