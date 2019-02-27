note() {
    (
        cd ~/code/sync
        echo "==> pulling"
        git pull --rebase
        vim -c 'r!date' -c 'normal i# ' -c 'normal 2o' -c 'normal O' notes.md
        if git diff --exit-code; then
            echo "==> no changes"
        else
            echo "==> prettifying"
            prettier --write notes.md
            echo "==> pushing"
            git commit -am "$(hostname)"
            if git push -u origin master; then
                echo "==> done"
            fi
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
        while [ ! -d .git ]; do
            cd ..
        done
        echo "==> generating ctags in $(pwd)"
        ctags -R .
    )
}

f() {
    find . -iname "*$1*"
}

a() {
    grep --color -FHIRin "$1" .
}

export CLICOLOR=1
export LSCOLORS=ExfxbxdxCxegedabagacad
export VISUAL=vim
export EDITOR=vim

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

alias cloud='cd ~/Library/Mobile\ Documents/com~apple~CloudDocs'
alias d='colordiff -u'
alias hg='history | grep'
alias l='ls -AF'
alias ll='ls -AFlh'
alias t='date +%s'

alias g='git'
alias gcgrep='git rev-list --all | xargs git grep'
alias gsubreset='git submodule foreach --recursive git checkout . && git submodule update --recursive --init'

HISTTIMEFORMAT='%F %T '
HISTSIZE=100000
HISTFILESIZE=100000
shopt -s histappend

PROMPT_COMMAND='rc=$?; [ $rc -ne 0 ] && printf "\e[31mexit: $rc\e[0m\n"'
PS1='\u@\h \w $(git rev-parse --abbrev-ref HEAD 2> /dev/null)\n\$ '
