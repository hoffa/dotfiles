note() {
    (
        set -ex
        cd ~/code/sync
        git pull --rebase
        vim -c 'r!date' -c 'normal i# ' -c 'normal 2o' -c 'normal O' notes.md
        if ! git diff --exit-code; then
            prettier --write notes.md
            git commit -am "$(hostname)"
            git push -u origin master
        fi
    )
}

brewsky() {
    (
        set -x
        brew update
        brew upgrade
        brew cleanup
        brew doctor
        npm update -g npm
        npm update -g
        npm doctor
        pip2 list --outdated
        pip3 list --outdated
    )
}

remtrail() {
    sed -i.bak 's/[[:space:]]*$//' "$1"
    rm "$1.bak"
}

export VISUAL=vi
export EDITOR=vi
export LSCOLORS=ExfxbxdxCxegedabagacad
export LS_COLORS='di=1;34:ln=35:so=31:pi=33:ex=1;32:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# Prefer colordiff
if command -v colordiff > /dev/null; then
    alias d='colordiff -u'
else
    alias d='diff -u'
fi

# Prefer fd
if command -v fd > /dev/null; then
    alias f='fd -Fi --hidden'
else
    f() { find . -iname "*$1*"; }
fi

# Prefer ripgrep
if command -v rg > /dev/null; then
    alias a='rg -Fi --hidden'
else
    alias a='grep -Finr'
fi

alias g='git'
alias ha='history | a'
alias t='date +%s'

alias sshhosts='grep -w Host ~/.ssh/config | cut -d" " -f2- | tr " " "\n" | sort | grep -Fv \*'
alias gitgrep='git rev-list --all | xargs git grep -Fin'

if [ "$(uname)" = "Darwin" ]; then
    alias l='ls -AF -G'
    alias ll='ls -AFlh -G'
    alias cloud='cd ~/Library/Mobile\ Documents/com~apple~CloudDocs'
else
    alias l='ls -AF --color'
    alias ll='ls -AFlh --color'
fi

HISTTIMEFORMAT='%F %T '
HISTFILESIZE=100000
HISTSIZE=100000
shopt -s histappend

PROMPT_COMMAND='rc=$?; [ $rc -ne 0 ] && printf "\e[31mexit: $rc\e[0m\n"'
PS1='\u@\h \w $(git rev-parse --abbrev-ref HEAD 2> /dev/null)\n\$ '
