export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export PATH=$PATH:/usr/local/sbin
export PATH=$PATH:$HOME/go/bin

fortune -s | cowsay -y

[ -f ~/.bash_aliases ] && . ~/.bash_aliases
[ -f ~/.bashrc ] && . ~/.bashrc
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
[ -f /usr/local/bin/aws_completer ] && complete -C /usr/local/bin/aws_completer aws
