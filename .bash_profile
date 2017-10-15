export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export PATH=$PATH:$(go env GOPATH)/bin

[ -f ~/.bash_aliases ] && . ~/.bash_aliases
[ -f ~/.bashrc ] && . ~/.bashrc

[ -f $(brew --prefix)/etc/bash_completion ] && . $(brew --prefix)/etc/bash_completion
complete -C $(brew --prefix)/bin/aws_completer aws
