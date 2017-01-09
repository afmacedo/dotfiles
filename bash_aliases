# -*- mode: sh -*-

alias headers="curl -I"

# Vagrant dev environment kickstarter
alias vssh="cd ~/vagrant && vagrant up && vagrant ssh"

# Color shell aliases
if [ "`uname`" == 'Linux' ]; then
  alias ls='ls --color=auto'
else
  alias ls='ls -G'
fi

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias gopath='export GOPATH=$(pwd)'
