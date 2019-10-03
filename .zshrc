export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export VISUAL=vi
export EDITOR=vi

export CLICOLOR=1

path+=~/go/bin
path+=/usr/local/sbin

bindkey -e

brewsky() {
    brew upgrade
    brew cask upgrade
    brew doctor

    npm update -g
    npm doctor

    pip3 list --outdated
}

f() {
    find . -iname "*$1*"
}

if command -v rg > /dev/null; then
    alias a='rg -Fi --hidden'
else
    a() {
        grep -Finr "$@" .
    }
fi

if command -v colordiff > /dev/null; then
    alias d='colordiff -u'
else
    alias d='diff -u'
fi

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

alias g='git'
alias l='ls -A'
alias ll='ls -AFlh'

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt EXTENDED_HISTORY
setopt PROMPT_SUBST

PROMPT='%(?..%F{red}exit: %?%f
)%n%F{blue}@%f%m%F{blue}:%f%~ %F{red}$(git rev-parse --abbrev-ref HEAD 2> /dev/null)%f
%# '
