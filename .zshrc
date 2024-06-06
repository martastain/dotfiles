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
[[ -d $HOME/.bin ]] && export PATH=$HOME/.bin:$PATH

#
# Editor
#

export LESS=
export GH_PAGER="less -FRX"

if type nvim &> /dev/null; then
  export VISUAL='nvim'
  export EDITOR='nvim'
  alias vim=nvim
elif type vim &> /dev/null; then
  export VISUAL='vim'
  export EDITOR='vim'
else
  export VISUAL='vi'
  export EDITOR='vi'
fi


#
# Utils
#

export FQDN=$(hostname -f 2> /dev/null)
alias myip=curl http://api.ipify.org 2> /dev/null

#
# Oh my ZSH
#

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="" # Do not use OMZ theme (use starship.rs)

plugins=(
   dirhistory
   docker
   gh
   git
   poetry
   poetry-env
   zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

#
# Aliases
#

if type exa &> /dev/null; then
  alias ls='exa --color=auto'
else
  alias ls='ls -F --color=tty'
fi

alias ll='ls -lg --time-style=long-iso'
alias la='ls -lga --time-style=long-iso'
alias l=ll

alias grep='grep --color'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Clockify CLI
alias ccin='clockify-cli in'
alias ccout='clockify-cli out'
alias ccshow='clockify-cli show'
alias pp='ptpython'


alias decompose='docker compose down -v --remove-orphans'
alias dcl='docker compose logs -f --tail=300'

#
# Terminal
#

if [ "$TERM" = "xterm-kitty" ]; then
  alias icat="echo && kitty +kitten icat --align=left"
  alias ssh="kitty +kitten ssh"
fi

if type starship &> /dev/null; then
  eval "$(starship init zsh)"
fi

if type mise &> /dev/null; then
  eval "$(mise activate zsh)"
fi
