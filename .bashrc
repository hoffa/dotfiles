BLUE='\[\e[0;34m\]'
CYAN='\[\e[0;36m\]'
GREEN='\[\e[0;32m\]'
OFF='\[\e[0m\]'
RED='\[\e[0;31m\]'
YELLOW='\[\e[1;33m\]'

git_branch() {
    git rev-parse --abbrev-ref HEAD 2> /dev/null | sed -e 's/\(.*\)/\1 /'
}

export CLICOLOR=1
if [[ $UID == 0 ]]; then
    export PS1="$RED\u \h \w \\$ $OFF"
else
    export PS1="$CYAN\u $BLUE\h $YELLOW\w $RED\$(git_branch)$GREEN\\$ $OFF"
fi

HISTFILESIZE=5000

f()  { find . -iname "*$1*"; }
g()  { grep -RHn --color=auto $2 "$1" *; }
gi() { g $1 -i; }
mc() { mkdir -p $1; cd $1; }

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

alias i='cd ~/Library/Mobile\ Documents/com~apple~CloudDocs'
alias l='ls -lahGF'

alias ga='git add'
alias gb='git branch'
alias gba='git branch -a'
alias gcm='git commit -m'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gd='git diff'
alias gl='git log'
alias gmv='git mv'
alias gp='git pull'
alias gpuo='git push -u origin'
alias grm='git rm'
alias gs='git status'
