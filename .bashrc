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
# Git related
#

alias gs='git status'
alias gc='git commit'
alias ga='git add'
alias gd='git diff'
alias gb='git branch'
alias gl='git log'
alias gsb='git show-branch'
alias gco='git checkout'
alias gg='git grep'
alias gk='gitk --all'
alias gr='git rebase'
alias gri='git rebase --interactive'
alias gcp='git cherry-pick'
alias grm='git rm'


#
# Splash
#

echo Welcome, sir
