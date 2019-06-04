export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export VISUAL=vi
export EDITOR=vi

export CLICOLOR=1

brewsky() {
    brew upgrade
    brew doctor

    npm update -g
    npm doctor

    pip3 list --outdated
}

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

alias a='rg -Fi --hidden'
alias d='colordiff -u'
alias f='fd -Fi --hidden'
alias g='git'
alias ha='history | a'
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
