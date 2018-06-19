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

alias a='rg --smart-case --ignore-file ~/.gitignore_global'
alias brewsky='brew update && brew upgrade && brew cleanup && brew prune; brew doctor'
alias c='( while [ ! -d .git ]; do cd ..; done; echo "😻 generating ctags in $(pwd)"; ctags -R )'
alias d='colordiff -u'
alias dr='docker run --rm -it'
alias i='cd ~/Cloud'
alias l='ls -lAhF'
alias note='vim ~/Cloud/Notes.md'
alias t2d='date -ur'
alias t='date +%s'
alias v='vim'
alias x='exit'

alias ga='git add'
alias gba='git branch -a'
alias gcam='git commit -am'
alias gcm='git commit -m'
alias gd='git diff'
alias gds='git diff --staged'
alias gdwd='git diff --word-diff'
alias gl='git log'
alias glg='git log --graph --oneline'
alias gmv='git mv'
alias gp='git pull'
alias gpoh='git push -u origin HEAD'
alias grm='git rm'
alias gs='git status'
alias gsh='git show'
alias gsubcheckout='git submodule foreach --recursive git checkout .'
alias gsubupdate='git submodule update --recursive --init'
alias gu='git remote -v'

HISTCONTROL=ignoredups:erasedups
HISTSIZE=100000
HISTFILESIZE=100000
shopt -s histappend
shopt -s checkwinsize

__smiley() { [ "$1" = "0" ] && printf "${GREEN}${ITAL}✓${OFF}" || printf "${RED}${ITAL}$1${OFF}"; }
__git_branch() {
    branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)
    [ ! -z "${branch}" ] && printf " (${branch})"
}
__prompt_command() {
    local STATUS="$?"
    PS1="$BLUE$ITAL\u$OFF at $RED$ITAL\h$OFF in $BLUE$ITAL\w$OFF\$(__git_branch) (\A) \$(__smiley $STATUS) \n\$ "
}
PROMPT_COMMAND=__prompt_command
