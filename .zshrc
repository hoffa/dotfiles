# Homebrew
export PATH=/opt/homebrew/bin:$PATH
export PATH=/opt/homebrew/sbin:$PATH
brewsky() {
    brew update
    brew upgrade
    brew autoremove
    brew cleanup
    brew leaves
    brew doctor
}
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Go
export PATH=$HOME/go/bin:$PATH

alias g='git'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias l='ls -a -G'
alias ll='ls -al -h -G'
alias d='colordiff -u'
alias a='rg -F -i -uuu'
alias f='fd --color never --fixed-strings --unrestricted'

# History
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

# Prompt
setopt PROMPT_SUBST
PROMPT='%B%(?..%F{red}%?%f )%F{blue}%~ %F{green}%#%f%b '
RPROMPT='%B%F{red}$(git rev-parse --abbrev-ref HEAD 2> /dev/null)%f%b'
