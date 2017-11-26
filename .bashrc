RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
BLUE=$(tput setaf 4)
OFF=$(tput sgr0)

smiley() {
    [ "$?" == "0" ] && echo "${GREEN}:)" || echo "${RED}:("
}
git_branch() {
    git rev-parse --abbrev-ref HEAD 2> /dev/null
}
f() {
    find . -iname "*$1*"
}
g() {
    grep -RHn --color=auto --exclude-dir=.git "$1" .
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
alias ts2date='date -ur'

alias ga='git add'
alias gba='git branch -a'
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
alias gu='git remote get-url origin'

HISTCONTROL=ignoredups:erasedups
HISTSIZE=100000
HISTFILESIZE=100000
shopt -s histappend
shopt -s checkwinsize

PS1="$YELLOW\A $BLUE\u \$(smiley)$OFF at $BLUE\h$OFF in $RED\w $YELLOW\$(git_branch)$OFF\n\\$ "

fortune -s | cowsay -y -f small
