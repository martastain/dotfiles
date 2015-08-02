# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

set -o notify
set completion-ignore-case on
set show-all-if-ambiguous on

export LANG='en_US.UTF-8'
export EDITOR=vim

export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
export HISTIGNORE=$'[ \t]*:&:[fb]g:exit'
export HISTIGNORE=$'[ \t]*:&:[fb]g:exit:ls'   # Ignore the ls command as well


alias grep='grep --color'                     # show differences in colour
alias egrep='egrep --color=auto'              # show differences in colour
alias fgrep='fgrep --color=auto'              # show differences in colour

alias ls='ls -hF --color=tty'                 # classify files in colour
alias dir='ls --color=auto --format=vertical'
alias vdir='ls --color=auto --format=long'
alias ll='ls -l'                              # long list
alias la='ls -A'                              # all but . and ..
alias l='ls -CF'                              #



if [ -d "${HOME}/.bin" ]; then
    PATH="${HOME}/.bin:$PATH"

    if [ "$(expr substr $(uname -s) 1 6)" == "CYGWIN" ] && [ -d "${HOME}/.bin/windows" ] ; then
        PATH="${HOME}/.bin/windows:$PATH"
    fi

fi

export COMSPEC=/cygdrive/c/Windows/System32/cmd.exe


echo Welcome, sir