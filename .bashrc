RED="\e[31m"
BLUE="\e[34m"
GREEN="\e[32m"
ITAL="\e[3m"
BOLD="\e[1m"
OFF="\e[0m"

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

__smiley() { [ "$1" = "0" ] && printf "${GREEN}✓${OFF}" || printf "${RED}$1${OFF}"; }
__prompt_command() {
    local STATUS="$?"
    PS1="$BLUE$ITAL$BOLD\u$OFF at $RED$ITAL$BOLD\h$OFF in $BLUE$ITAL$BOLD\w$OFF\$(__git_ps1) $OFF(\A) \$(__smiley $STATUS) \n\$ "
}
PROMPT_COMMAND=__prompt_command

if [ "$(uname)" = "Darwin" ]; then
    alias l='ls -lAhF'
    alias note='vim ~/Cloud/Notes.md'
    fortune -s | cowsay -f small -y
else
    alias l='ls -lAhF --color=auto'
fi

c() { cd "$1" && l; }
