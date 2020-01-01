export CLICOLOR=1

brewsky() {
    brew upgrade
    brew cask upgrade
    brew cleanup
    brew doctor
    npm update -g
    npm doctor
}

f() { find . -iname "*$1*"; }
a() { grep -Finr "$@" .; }

if [ "$(uname)" = Linux ]; then
    alias l='ls -A --color'
    alias ll='l -Flh'
else
    alias l='ls -A'
    alias ll='l -Flh'
fi
alias d='diff -u'
alias g='git'
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
)%n@%m:%~ %F{red}$(git rev-parse --abbrev-ref HEAD 2> /dev/null)%f
%F{green}%#%f '
