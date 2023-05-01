# Homebrew
export PATH=/opt/homebrew/bin:$PATH
export PATH=/opt/homebrew/sbin:$PATH
brewsky() {
    brew update
    brew upgrade
    brew doctor
}
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Go
export PATH=$HOME/go/bin:$PATH

# Terminal colors
export CLICOLOR=1
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43'

alias g='git'
alias l='exa -a'
alias ll='exa -alg'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias d='colordiff -u'
alias a='rg -F -i -uuu'
alias f='fd --fixed-strings --unrestricted'
alias c='bat --theme ansi --style plain -P'

# History
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

# Prompt
setopt PROMPT_SUBST
PROMPT='%B%(?..%F{red}%?%f )%F{blue}%~ %#%f%b '
RPROMPT='%B%F{red}$(git rev-parse --abbrev-ref HEAD 2> /dev/null)%f%b'
