# -*- mode: sh -*-

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

export GIT_EDITOR="vim"
export VISUAL="vim"

# which platform?
UNAME=`uname`

if [ -f $HOME/.bash_functions ]; then
    source $HOME/.bash_functions
fi

# find_git
# find_brew
find_completion
# find_ruby
# find_subl
fix_path

# local changes
if [ -f ~/.local_bashrc ]; then
    . ~/.local_bashrc
fi

# include aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Reset
Color_Off='\e[0m'       # Text Reset

# Regular Colors
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White

# Bold
BBlack='\e[1;30m'       # Black
BRed='\e[1;31m'         # Red
BGreen='\e[1;32m'       # Green
BYellow='\e[1;33m'      # Yellow
BBlue='\e[1;34m'        # Blue
BPurple='\e[1;35m'      # Purple
BCyan='\e[1;36m'        # Cyan
BWhite='\e[1;37m'       # White

# Underline
UBlack='\e[4;30m'       # Black
URed='\e[4;31m'         # Red
UGreen='\e[4;32m'       # Green
UYellow='\e[4;33m'      # Yellow
UBlue='\e[4;34m'        # Blue
UPurple='\e[4;35m'      # Purple
UCyan='\e[4;36m'        # Cyan
UWhite='\e[4;37m'       # White

# Background
On_Black='\e[40m'       # Black
On_Red='\e[41m'         # Red
On_Green='\e[42m'       # Green
On_Yellow='\e[43m'      # Yellow
On_Blue='\e[44m'        # Blue
On_Purple='\e[45m'      # Purple
On_Cyan='\e[46m'        # Cyan
On_White='\e[47m'       # White

# High Intensity
IBlack='\e[0;90m'       # Black
IRed='\e[0;91m'         # Red
IGreen='\e[0;92m'       # Green
IYellow='\e[0;93m'      # Yellow
IBlue='\e[0;94m'        # Blue
IPurple='\e[0;95m'      # Purple
ICyan='\e[0;96m'        # Cyan
IWhite='\e[0;97m'       # White

# Bold High Intensity
BIBlack='\e[1;90m'      # Black
BIRed='\e[1;91m'        # Red
BIGreen='\e[1;92m'      # Green
BIYellow='\e[1;93m'     # Yellow
BIBlue='\e[1;94m'       # Blue
BIPurple='\e[1;95m'     # Purple
BICyan='\e[1;96m'       # Cyan
BIWhite='\e[1;97m'      # White

# High Intensity backgrounds
On_IBlack='\e[0;100m'   # Black
On_IRed='\e[0;101m'     # Red
On_IGreen='\e[0;102m'   # Green
On_IYellow='\e[0;103m'  # Yellow
On_IBlue='\e[0;104m'    # Blue
On_IPurple='\e[0;105m'  # Purple
On_ICyan='\e[0;106m'    # Cyan
On_IWhite='\e[0;107m'   # White

###
# Git juice  
[[ -s "$HOME/.git-prompt.sh" ]] && source "$HOME/.git-prompt.sh"

###
# Boxen
[[ -s "/opt/boxen/env.sh" ]] && source "/opt/boxen/env.sh"

###
# Aliases
[[ -s "$HOME/.bash_aliases" ]] && source "$HOME/.bash_aliases"

###
# Prompt setup
HOST_COLOR=$BBlue

if [ ! `hostname -i | grep 127.0 | wc -l` -gt 0 ]; then
  HOST_COLOR=${On_Blue}${BWhite}
fi

if [ -e "/usr/bin/git" ]; then
  PS1="\[$BGreen\]\u\[$BCyan\]@\[$HOST_COLOR\]\h\[\033[00m\]\[$BYellow\]\[$BYellow\]\w\[\033[m\]\[$BPurple\]\$(__git_ps1)\[$BWhite\]\$ \[\033[00m\]" 
else
  PS1='\[\033[01;32m\]\u\[\033[01;37m\]@\[\033[01;34m\]\h\[\033[00m\] . \W \$ '
fi

PATH=$HOME/bin:/usr/local/bin:$PATH

###
# Pew
if [ ! -z $VIRTUAL_ENV ]; then
    PEW_AUTOCOMPLETE="$( dirname "$(pew shell_config)" )"/complete.bash

    [ -f $PEW_AUTOCOMPLETE ] && source $PEW_AUTOCOMPLETE

    PS1="\[$BWhite\]VE: [\[$BRed\]$(basename $VIRTUAL_ENV)\[$BWhite\]]\[\033[00m\] $PS1"
fi

workon () {
    set_title $*
    pew workon $*
}

set_title () {
    printf '\e]2;%s\a' "$*";
}
