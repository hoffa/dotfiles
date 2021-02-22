export CLICOLOR=1

brewsky() {
	brew upgrade
	brew upgrade --cask
	brew cleanup
	brew doctor
}

alias fx='whence -pm \* | xargs -L 1 basename | grep -Fi'

alias d='diff -u'
alias g='git'
alias l='ls -a'
alias ll='ls -al'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

a() { grep -Finr "$@" .; }
f() { find -L . -iname "*$1*"; }
c() { cd "$@" && ls -al; }

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt PROMPT_SUBST
bindkey -e

PROMPT='%(?..%F{red}%Bexit: %?%b%f
)%B%F{green}%n %F{cyan}%m %F{blue}%~ %F{red}$(git rev-parse --abbrev-ref HEAD 2> /dev/null)
%F{green}%#%f%b '
