RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
MAGENTA="\e[35m"
OFF="\e[0m"

f() {
    find . -iname "*$1*"
}

note() {
    (
        set -e
        cd ~/code/sync
        printf "🌀 ${BLUE}just a sec, pulling changes...${OFF}\n"
        git pull --rebase
        vim -c 'r!date' -c 'normal i# ' -c 'normal 2o' -c 'normal O' notes.md
        printf "💅 ${MAGENTA}making it pretty...${OFF}\n"
        prettier --write notes.md
        printf "🌀 ${BLUE}checking for any differences...${OFF}\n"
        if git diff --exit-code; then
            printf "🐣 ${YELLOW}no changes ¯\_(ツ)_/¯${OFF}\n"
        else
            printf "🌀 ${BLUE}syncing back...${OFF}\n"
            git commit -am ":cyclone: $newwc $(hostname)"
            git push -u origin master
            printf "✅ ${GREEN}done!${OFF}\n"
        fi
    )
}

brewsky() {
    (
        set -x
        brew update
        brew upgrade
        brew cleanup
        brew prune
        brew doctor
        npm update -g
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
export VISUAL=vim
export EDITOR=vim

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

alias d='colordiff -u'
alias g='grep -FHIRin --color=auto --exclude-dir=.git'
alias hg='history | grep'
alias psg='ps aux | grep'
alias server='python -m SimpleHTTPServer 80'
alias t2d='date -ur'
alias t='date +%s'

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
    alias l='ls -lAhFT'
else
    alias l='ls -lAhF --color'
fi

HISTTIMEFORMAT='%F %T '
HISTSIZE=100000
HISTFILESIZE=100000
shopt -s histappend
shopt -s checkwinsize

__smiley() { [ "$1" -eq 0 ] && printf "${GREEN}:)${OFF}" || printf "${RED}$1${OFF}"; }
__git_branch() {
    local branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)
    [ ! -z "${branch}" ] && printf " $RED${branch}$OFF"
}
__prompt_command() {
    local STATUS="$?"
    PS1="$BLUE\u$OFF at $RED\h$OFF in $BLUE\w$OFF\$(__git_branch) \$(__smiley $STATUS) \n\$ "
}
PROMPT_COMMAND=__prompt_command
