export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export PATH=$PATH:/usr/local/sbin
export PATH=$PATH:$HOME/go/bin

[ -f ~/.bash_aliases ] && . ~/.bash_aliases
[ -f ~/.bashrc ] && . ~/.bashrc
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
