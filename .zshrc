#
# Locale
#

export LANG="en_US.UTF-8"

export LC_CTYPE="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_PAPER="en_US.UTF-8"
export LC_NAME="en_US.UTF-8"
export LC_ADDRESS="en_US.UTF-8"
export LC_TELEPHONE="en_US.UTF-8"
export LC_MEASUREMENT="en_US.UTF-8"
export LC_IDENTIFICATION="en_US.UTF-8"
export LC_ALL=

#
# Paths
#

[[ -d $HOME/.local/bin ]] && export PATH=$HOME/.local/bin:$PATH
[[ -d $HOME/.local/bin/poetry ]] && export PATH=$HOME/.local/bin/poetry:$PATH
[[ -d $HOME/bin ]] && export PATH=$HOME/bin:$PATH

# pyenv
[[ -d $HOME/.pyenv ]] && export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
#
# nvm
[[ -d $HOME/.nvm ]] && export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

export ZSH="$HOME/.oh-my-zsh"

#
# Editor
#

export LESS=
export GH_PAGER="less -FRX"

# TODO: use nvim only if it's installed
alias vim=nvim

if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
else
   export EDITOR='nvim'
fi


#
# Utils
#

export FQDN=$(hostname -f 2> /dev/null)
alias myip=curl http://api.ipify.org 2> /dev/null

#
# Oh my ZSH & Theme
#

plugins=(
  git
  poetry
  autoswitch_virtualenv
  zsh-autosuggestions
  dirhistory
)

source $ZSH/oh-my-zsh.sh

PROMPT='
%{$fg[green]%}%n%{$reset_color%}%{$fg[cyan]%}@%{$fg[green]%}%M%{$reset_color%} %{$fg_bold[yellow]%}%~%{$reset_color%}%{$fg[cyan]%}$(git_prompt_info)
%{$fg[white]%}$ %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX=" [%{$reset_color%}%{$fg[white]%}git://%{$fg_bold[white]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}%{$fg[cyan]%}]"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}✔%{$reset_color%}"

#
# Aliases
#


if type exa &> /dev/null; then
  alias ls='exa --color=auto'
else
  alias ls='ls -F --color=tty'
fi

alias ll='ls -l'
alias la='ls -A'

alias grep='grep --color'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'


if [ "$TERM" = "xterm-kitty" ]; then
  alias icat="echo && kitty +kitten icat --align=left"
  alias ssh="kitty +kitten ssh"
fi

unsetopt INC_APPEND_HISTORY
