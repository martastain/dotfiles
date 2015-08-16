#
# PATH
#

if [ -d "${HOME}/.bin" ]; then
    PATH="${HOME}/.bin:$PATH"

    if [ "$(expr substr $(uname -s) 1 6)" == "CYGWIN" ] && [ -d "${HOME}/.bin/windows" ] ; then
        PATH="${HOME}/.bin/windows:$PATH"
    fi

fi

export COMSPEC=/cygdrive/c/Windows/System32/cmd.exe


# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return


#
# ENV
#

set -o notify
set completion-ignore-case on
set show-all-if-ambiguous on

export LANG='en_US.UTF-8'
export EDITOR=vim

export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
export HISTIGNORE=$'[ \t]*:&:[fb]g:exit'
export HISTIGNORE=$'[ \t]*:&:[fb]g:exit:ls'   # Ignore the ls command as well

BLACK='\e[0;30m'
BLUE='\e[0;34m'
GREEN='\e[0;32m'
CYAN='\e[0;36m'
RED='\e[0;31m'
PURPLE='\e[0;35m'
BROWN='\e[0;33m'
LIGHTGRAY='\e[0;37m'
DARKGRAY='\e[1;30m'
LIGHTBLUE='\e[1;34m'
LIGHTGREEN='\e[1;32m'
LIGHTCYAN='\e[1;36m'
LIGHTRED='\e[1;31m'
LIGHTPURPLE='\e[1;35m'
YELLOW='\e[1;33m'
WHITE='\e[1;37m'


#
# Aliases
#

alias grep='grep --color'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

alias ls='ls -hF --color=tty'
alias dir='ls --color=auto --format=vertical'
alias vdir='ls --color=auto --format=long'
alias ll='ls -l'                              # long list
alias la='ls -A'                              # all but . and ..
alias l='ls -CF'
alias cls='clear'
alias f="find . | grep "

#
# Quick access
#

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias dl='cd ~/Downloads/'
alias doc='cd ~/Documents/'


#
# Shell
#

source ~/.bin/git-prompt.sh
PS1="\[\e]0;\w\a\]\n\[${GREEN}\]\u@\h \[${YELLOW}\]\w\[\e[0m\]$(__git_ps1 ' (%s)')\n\$ "

#
# MOTD 
#

echo -ne "${DARKGRAY}""Welcome to `hostname`'s terminal, `whoami`.\n"


