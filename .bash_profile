export PATH=$PATH:$(go env GOPATH)/bin

if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi

if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi
