export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export VISUAL=vi
export EDITOR=vi

export CLICOLOR=1

path+=~/go/bin

bindkey -e

brewsky() {
    brew upgrade
    brew cask upgrade
    brew cleanup
    brew doctor

    npm update -g
    npm doctor

    pip3 list --outdated
}

f() { find . -iname "*$1*"; }
a() { grep -Finr "$@" .; }

alias d='diff -u'
alias g='git'
alias l='ls -A'
alias ll='ls -AFlh'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt EXTENDED_HISTORY
setopt PROMPT_SUBST

PROMPT='%(?..%F{red}exit: %?%f
)%n%F{green}@%f%m%F{green}:%f%~ %F{red}$(git rev-parse --abbrev-ref HEAD 2> /dev/null)%f
%# '
