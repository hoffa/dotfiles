RED="\e[31m"
GREEN="\e[32m"
BLUE="\e[34m"
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
alias c='( while [ ! -d .git ]; do cd ..; done; echo "😻 generating ctags in $(pwd)"; ctags -R )'
alias d='colordiff -u'
alias ha='history | rg'
alias pyg='pygmentize'
alias t2d='date -ur'
alias t='date +%s'

alias ga='git add'
alias gba='git branch -a'
alias gcam='git commit -am'
alias gcgrep='git rev-list --all | xargs git grep'
alias gcm='git commit -m'
alias gcr='git clone --recursive'
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

if [[ $(uname) = "Darwin" ]]; then
    alias brewsky='brew update && brew upgrade && brew cleanup && brew prune; brew doctor'
    alias i='cd ~/Cloud'
    alias l='ls -lAhFT'
    alias note="vim -c 'r!date' -c 'normal i# ' -c 'normal 2o' -c 'normal O' ~/Library/Mobile\ Documents/com~apple~CloudDocs/Notes.md"
else
    alias l='ls -lAhF --color'
fi

HISTTIMEFORMAT='%F %T '
HISTCONTROL=ignoredups:erasedups
HISTSIZE=100000
HISTFILESIZE=100000
shopt -s histappend
shopt -s checkwinsize

__smiley() { [ "$1" = "0" ] && printf "${GREEN}✓${OFF}" || printf "${RED}$1${OFF}"; }
__git_branch() {
    branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)
    [ ! -z "${branch}" ] && printf " $RED${branch}$OFF"
}
__prompt_command() {
    local STATUS="$?"
    PS1="$BLUE\u$OFF at $RED\h$OFF in $BLUE\w$OFF\$(__git_branch) \$(__smiley $STATUS) \n\$ "
}
PROMPT_COMMAND=__prompt_command
