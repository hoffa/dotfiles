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
        brew doctor
        brew cleanup
        npm update -g npm
        npm update -g
        npm doctor
        pip2 install --upgrade pip
        pip3 install --upgrade pip
        pip2 list --outdated
        pip3 list --outdated
    )
}

c() {
    (
        set -ex
        while [ ! -d .git ]; do
            cd ..
        done
        ctags -R .
    )
}

f() {
    find . -iname "*$1*"
}

a() {
    grep --color -FHIRin "$1" .
}

d() {
    colordiff -u "$1" "$2" | less -RFX
}

export VISUAL=vi
export EDITOR=vi

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

alias hg='history | grep'
alias t='date +%s'
alias g='git'

alias gitgrep='git rev-list --all | xargs git grep'

if [ "$(uname)" = "Darwin" ]; then
    export LSCOLORS=ExfxbxdxCxegedabagacad
    alias l='ls -AFG'
    alias ll='ls -AFlhG'
    alias cloud='cd ~/Library/Mobile\ Documents/com~apple~CloudDocs'
else
    alias l='ls -AF --color'
    alias ll='ls -AFlh --color'
fi

HISTTIMEFORMAT='%F %T '
HISTSIZE=100000
HISTFILESIZE=100000
shopt -s histappend

PROMPT_COMMAND='rc=$?; [ $rc -ne 0 ] && printf "\e[31mexit: $rc\e[0m\n"'
PS1='\u@\h \w $(git rev-parse --abbrev-ref HEAD 2> /dev/null)\n\$ '
