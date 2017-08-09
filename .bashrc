git_branch() {
    git rev-parse --abbrev-ref HEAD 2> /dev/null | awk '{print $1" "}'
}
d() {
    colordiff -ur "$1" "$2"
}
f() {
    find . -iname "*$1*"
}
g() {
    grep -RHn --color=auto $2 "$1" *
}
ts2date() {
    date -ur $1 +"%Y-%m-%d %H:%M:%S UTC"
}
ip() {
    for i in `ifconfig -l | xargs -n1 | sort`
    do
        echo "$i: `ipconfig getifaddr $i || echo None`"
    done
    echo "External: `dig +short myip.opendns.com @resolver1.opendns.com 2> /dev/null || echo None`"
}

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

alias a='ack'
alias i='cd ~/Cloud'
alias l='exa -la'
alias note='vim ~/Cloud/Notes.txt'
alias ts='date +%s'

alias ga='git add'
alias gcm='git commit -m'
alias gcam='git commit -am'
alias gd='git diff'
alias gdwd='git diff --word-diff'
alias gl='git log'
alias glg='git log --graph --oneline'
alias gmv='git mv'
alias gp='git pull'
alias gpuo='git push -u origin'
alias gpuom='git push -u origin master'
alias grm='git rm'
alias gs='git status'
alias gsh='git show'

YELLOW='\[\e[0;33m\]'
GREEN='\[\e[0;32m\]'
GRAY='\[\e[0;90m\]'
BLUE='\[\e[0;34m\]'
RED='\[\e[0;31m\]'
OFF='\[\e[0m\]'

HISTCONTROL=ignoredups:erasedups
HISTSIZE=10000
HISTFILESIZE=10000

shopt -s histappend
shopt -s checkwinsize

export CLICOLOR=1
export PS1="$RED\u $BLUE\h $YELLOW\$(git_branch)$RED\w\n$RED\\$ $OFF"

tput setaf 1; fortune -s | cowsay -y
