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
# Prompt
#

if type starship &> /dev/null; then
  eval "$(starship init zsh)"
fi


#
# Mise
#

if type mise &> /dev/null; then
  eval "$(mise activate zsh)"
fi


#
# Plugins
#

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi


# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::aws
zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# Fix broken terminals

bindkey '^[w' kill-region
bindkey '^[[1;5D' backward-word   # Ctrl+Left
bindkey '^[[1;5C' forward-word    # Ctrl+Right

#
# History
#

HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase

setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Aliases

if type exa &> /dev/null; then
  alias ls='exa --color=auto'
else
  alias ls='ls -F --color=tty'
fi

alias ll='ls -lg --time-style=long-iso'
alias la='ls -lga --time-style=long-iso'
alias l=ll

alias c='clear'
alias va='. ./.venv/bin/activate'

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


alias grep='grep --color'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Docker

alias decompose='docker compose down -v --remove-orphans'
alias dcl='docker compose logs -f --tail=300'

#
# Pager
#

export LESS=
export GH_PAGER="less -FRX"

#
# Utils
#

export FQDN=$(hostname -f 2> /dev/null)
alias myip=curl http://api.ipify.org 2> /dev/null

if [ -f $HOME/.cargo/env ]; then
  source "$HOME/.cargo/env"
fi

if type fzf &> /dev/null; then
  eval "$(fzf --zsh)"
fi

if type zoxide &> /dev/null; then
  eval "$(zoxide init --cmd cd zsh)"
fi
