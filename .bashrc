RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
BLUE=$(tput setaf 4)
GREY=$(tput setaf 8)
BOLD=$(tput bold)
OFF=$(tput sgr0)

smiley() { [ "$?" == "0" ] && echo "${GREEN}:)${OFF}" || echo "${RED}:(${OFF}"; }
git_branch() { git rev-parse --abbrev-ref HEAD 2> /dev/null; }
f() { find . -iname "*$1*"; }
g() { grep -RHn --color=auto --exclude-dir=.git "$1" .; }

export CLICOLOR=1
export VISUAL=vim
export EDITOR=vim

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

alias a='rg --smart-case'
alias i='cd ~/Cloud'
alias d='colordiff -u'
alias t='date +%s'
alias t2d='date -ur'
alias v='vim'
alias x='exit'

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
alias gpoh='git push -u origin HEAD'
alias grm='git rm'
alias gs='git status'
alias gsh='git show'
alias gu='git remote -v'
alias gsubcheckout='git submodule foreach --recursive git checkout .'
alias gsubupdate='git submodule update --recursive --init'

HISTCONTROL=ignoredups:erasedups
HISTSIZE=100000
HISTFILESIZE=100000
shopt -s histappend
shopt -s checkwinsize

PS1="$BOLD$BLUE\u$OFF $BOLD$RED\h$OFF $BOLD$BLUE\w \$(smiley) \A $OFF\$(git_branch)\n\$ "

if [ "$(uname)" = "Darwin" ]; then
    alias l='ls -lAhF'
    alias note='vim ~/Cloud/Notes.md'
    fortune -s | cowsay -f small -y
else
    alias l='ls -lAhF --color=auto'
fi

c() { cd "$1" && l; }
