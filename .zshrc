export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export VISUAL=vi
export EDITOR=vi

export CLICOLOR=1
export LSCOLORS=ExfxbxdxCxegedabagacad
export LS_COLORS='di=1;34:ln=35:so=31:pi=33:ex=1;32:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43'

path+=~/go/bin
path+=/usr/local/sbin

bindkey -e

brewsky() {
    brew upgrade
    brew doctor

    npm update -g
    npm doctor

    pip3 list --outdated
}

command_exists() {
    command -v "$@" > /dev/null
}

f() {
    find . -iname "*$1*"
}

if command_exists colordiff; then
    alias d='colordiff -u'
else
    alias d='diff -u'
fi

if command_exists rg; then
    alias a='rg -Fi --hidden'
else
    alias a='grep -Finr'
fi

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

alias g='git'
alias ha='history -E 0 | a'
alias l='ls -A'
alias ll='ls -AFlh'
alias t='date +%s'

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt PROMPT_SUBST
setopt EXTENDED_HISTORY

PROMPT='%(?..%F{red}exit: %?%f
)%n@%m %~ $(git rev-parse --abbrev-ref HEAD 2> /dev/null)
%# '
