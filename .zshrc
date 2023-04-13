export CLICOLOR=1
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43'

alias d='diff -u'
alias g='git'
alias l='ls -a'
alias ll='ls -al'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

if command -v rg > /dev/null; then
    alias a='rg -F -i -uuu'
else
    a() { grep -Finr "$@" .; }
fi

if command -v fd > /dev/null; then
    alias f='fd --fixed-strings --unrestricted'
else
    f() { find -L . -iname "*$1*"; }
fi

setopt PROMPT_SUBST
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
PROMPT='%B%(?..%F{red}%?%f )%F{blue}%~ %#%f%b '
RPROMPT='%B%F{red}$(git rev-parse --abbrev-ref HEAD 2> /dev/null)%f%b'
