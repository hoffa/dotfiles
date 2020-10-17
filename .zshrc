brewsky() {
	brew upgrade
	brew upgrade --cask
	brew cleanup
	brew doctor
	npm update -g
	npm doctor
}

alias fx='whence -pm \* | xargs -L 1 basename | grep -Fi'

if command -v fd >/dev/null; then
	alias f='fd -HIL'
else
	f() { find -L . -iname "*$1*"; }
fi

if command -v rg >/dev/null; then
	alias a='rg -Fi --hidden'
else
	a() { grep -Finr "$@" .; }
fi

if command -v exa >/dev/null; then
	alias l='exa -a'
	alias ll='exa -agl --time-style=long-iso'
else
	alias l='ls -a'
	alias ll='ls -alF'
fi

if command -v colordiff >/dev/null; then
	alias d='colordiff -u'
else
	alias d='diff -u'
fi

alias g='git'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt EXTENDED_HISTORY
setopt PROMPT_SUBST
bindkey -e

PROMPT='%(?..%F{red}%Bexit: %?%b%f
)%n%F{green}%B@%b%f%m%F{green}%B:%b%f%~ %F{red}%B$(git rev-parse --abbrev-ref HEAD 2> /dev/null)%b%f
%F{green}%B%#%b%f '
