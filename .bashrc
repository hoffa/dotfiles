git_branch() {
    git rev-parse --abbrev-ref HEAD 2> /dev/null
}
f() {
    find . -iname "*$1*"
}
g() {
    grep -RHn --color=auto --exclude-dir=.git "$1" .
}
ts2date() {
    date -ur $1 +"%Y-%m-%d %H:%M:%S UTC"
}

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

alias a='ack --smart-case'
alias i='cd ~/Cloud'
alias d='colordiff -u'
alias l='ls -lAhFG'
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

HISTCONTROL=ignoredups:erasedups
HISTSIZE=100000
HISTFILESIZE=100000
shopt -s histappend
shopt -s checkwinsize

RED=$(tput setaf 1)
YELLOW=$(tput setaf 3)
BLUE=$(tput setaf 4)
OFF=$(tput sgr0)
PS1="$BLUE\u$OFF at $BLUE\h$OFF in $RED\w $YELLOW\$(git_branch)$OFF\n\\$ "

fortune -s | cowsay
