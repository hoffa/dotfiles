export CLICOLOR=1

alias d='diff -u'
alias g='git'
alias l='ls -a'
alias ll='ls -al'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

a() { grep -Finr "$@" .; }
f() { find -L . -iname "*$1*"; }

setopt PROMPT_SUBST
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
PROMPT='%B%(?..%F{red}%?%f )%F{blue}%~ %#%f%b '
RPROMPT='%B%F{red}$(git rev-parse --abbrev-ref HEAD 2> /dev/null)%f%b'
