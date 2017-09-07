#
# PATH
#

if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.bin" ]; then
    PATH="$HOME/.bin:$PATH"
fi

#
# ENV
#

if [ -d ~/Devel/go ]; then
    export GOPATH=$(realpath ~/Devel/go)
fi

export LANG='en_US.UTF-8'
export EDITOR=vim
export FQDN=$(hostname -f 2> /dev/null)

export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
export HISTIGNORE=$'[ \t]*:&:[fb]g:exit'
export HISTIGNORE=$'[ \t]*:&:[fb]g:exit:ls'   # Ignore the ls command as well

#
# Aliases
#

alias grep='grep --color'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

alias ls='ls -F --color=tty'
alias ll='ls -l'                              # long list
alias la='ls -A'                              # all but . and ..
alias lla='ls -lA'
alias l='ls -CF'
alias cls='clear'
alias f="find . | grep "
alias p="ps axu | grep "

alias mp="ncmpcpp"                            # Caffeine desktop music
alias mc="TERM=\"xterm-256color\" mc"

#
# If not running interactively, stop here
#

[[ "$-" != *i* ]] && return

#
# Private settings (ssh aliases etc)
#

if [ -f ${HOME}/.private/special/bashrc ]; then
    source ${HOME}/.private/special/bashrc
fi

#
# Prompt
#

set -o notify
set completion-ignore-case on
set show-all-if-ambiguous on

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

if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
    LCOLOR=$BLUE
else
    LCOLOR=$GREEN
fi

PS1="\[\e]0;\w\a\]\n\[${LCOLOR}\]\u@\h \[${YELLOW}\]\w\[\e[0m\]\n\$ "

#
# Cygwin
#

if [ "$(expr substr $(uname -s) 1 6)" == "CYGWIN" ]; then

    export TERM="xterm-256color"
    export COMSPEC="/cygdrive/c/Windows/System32/cmd.exe"

    if [ -d "$HOME/.bin/windows" ]; then
        PATH="$HOME/.bin/windows:$PATH"
    fi
fi

#
# motd
#

echo -e "${DARKGRAY}Welcome to $FQDN, $USER."
