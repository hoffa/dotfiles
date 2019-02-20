note() {
    (
        cd ~/code/sync
        echo "🌀 just a sec, pulling changes..."
        git pull --rebase
        vim -c 'r!date' -c 'normal i# ' -c 'normal 2o' -c 'normal O' notes.md
        echo "💅 making it pretty..."
        prettier --write notes.md
        echo "🌀 checking for any differences..."
        if git diff --exit-code; then
            echo "🐣 no changes ¯\_(ツ)_/¯"
        else
            echo "🌀 syncing back..."
            git commit -am ":cyclone: $(hostname)"
            if git push -u origin master; then
                echo "✅ done!!"
            else
                echo "👀 remember to push once connected"
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
        echo "😻 generating ctags in $(pwd)"
        ctags -R
    )
}

export CLICOLOR=1
export LSCOLORS=ExfxbxdxCxegedabagacad
export VISUAL=vim
export EDITOR=vim

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

alias d='colordiff -u'
alias hg='history | grep'
alias server='python -m SimpleHTTPServer 80'
alias t='date +%s'
alias l='ls -AF'
alias ll='ls -AFlh'

alias ga='git add'
alias gba='git branch -a'
alias gcam='git commit -am'
alias gcgrep='git rev-list --all | xargs git grep'
alias gcm='git commit -m'
alias gd='git diff'
alias gds='git diff --staged'
alias gdwd='git diff --word-diff'
alias gl='git log'
alias glg='git log --graph --oneline'
alias gmv='git mv'
alias gp='git pull'
alias gpoh='git push -u origin HEAD'
alias grm='git rm'
alias gs='git status'
alias gsh='git show'
alias gsubreset='git submodule foreach --recursive git checkout . && git submodule update --recursive --init'
alias gu='git remote -v'

if [ "$(uname)" = "Darwin" ]; then
    alias g='rg -Fi'
    alias f='fd -HF'
    alias cloud='cd ~/Library/Mobile\ Documents/com~apple~CloudDocs'
else
    alias g='grep -FHIRin'
    f() { find . -iname "*$1*"; }
fi

HISTTIMEFORMAT='%F %T '
HISTSIZE=100000
HISTFILESIZE=100000
shopt -s histappend

PROMPT_COMMAND='rc=$?; [ $rc -ne 0 ] && printf "\e[31mexit: $rc\e[0m\n"'
PS1='\u@\h \w $(git rev-parse --abbrev-ref HEAD 2> /dev/null)\n\$ '
