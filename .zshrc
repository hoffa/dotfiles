export CLICOLOR=1

brewsky() {
    brew upgrade
    brew cask upgrade
    brew cleanup
    brew doctor
    npm update -g
    npm doctor
}

f() { find -L . -iname "*$1*"; }

if command -v rg > /dev/null; then
    alias a='rg -Fi'
else
    a() { grep -Finr "$@" .; }
fi

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
bindkey -e
path+=~/go/bin

PROMPT='%(?..%F{red}exit: %?%f
)%n@%m:%~ %F{magenta}$(git rev-parse --abbrev-ref HEAD 2> /dev/null)%f
%F{green}%#%f '
