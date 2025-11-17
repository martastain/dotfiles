# zmodload zsh/zprof

autoload -Uz add-zsh-hook

ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE="20"
ZSH_AUTOSUGGEST_USE_ASYNC=1

#
# Locale
#

export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

#
# Paths
#

[[ -d $HOME/.local/bin ]] && export PATH=$HOME/.local/bin:$PATH
[[ -d $HOME/.bin ]] && export PATH=$HOME/.bin:$PATH



#
# Mise
#

if type mise &> /dev/null; then
  eval "$(mise activate zsh)"
fi

#
# Prompt
#

if type starship &> /dev/null; then
  eval "$(starship init zsh)"
fi

#
# Plugins
#

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"
source "${HOME}/.config/zsh-catppuccin.zsh"

# Add in zsh plugins
zinit light-mode for \
  zsh-users/zsh-autosuggestions \
  zsh-users/zsh-syntax-highlighting \
  zsh-users/zsh-completions \
  Aloxaf/fzf-tab

#
# Load completions
#

autoload -Uz compinit
typeset -U fpath
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zcompcache
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':completion:*' completer _complete _ignored _expand_alias

ZCD=~/.zcompdump

# If dump doesn’t exist or is older than 1 day, rebuild it
if [[ ! -f ${ZCD} || $(date +%s -r ${ZCD}) -lt $(($(date +%s) - 86400)) ]]; then
  compinit -u -C -d ${ZCD}
  zcompile ${ZCD}
else
  compinit -C -d ${ZCD}
fi


#
# Keybindings
#

bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# Fix broken terminals
bindkey '^[w' kill-region
bindkey '^[[1;5D' backward-word   # Ctrl+Left
bindkey '^[[1;5C' forward-word    # Ctrl+Right
bindkey "^[[3~" delete-char

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



# Aliases

if type exa &> /dev/null; then
  alias ls='exa --color=auto'
else
  alias ls='ls -F --color=tty'
fi

alias ll='ls -lg --time-style=long-iso'
alias la='ls -lga --time-style=long-iso'
alias l=ll

alias -g ...='../..'
alias -g ....='../../..'

alias c='clear'
alias va='. ./.venv/bin/activate'

if type nvim &> /dev/null; then
  export VISUAL='nvim'
  export EDITOR='nvim'
  alias vim=nvim
  alias vi=nvim
elif type vim &> /dev/null; then
  export VISUAL='vim'
  export EDITOR='vim'
  alias vi=vim
else
  export VISUAL='vi'
  export EDITOR='vi'
fi


alias grep='grep --color'
alias egrep='grep -E --color=auto'
alias decompose='docker compose down -v --remove-orphans'
alias dcl='docker compose logs -f --tail=300'

#
# Pager
#

export LESS=
export GH_PAGER="less -FRX"

#
# Fzf
#

export FZF_DEFAULT_OPTS=" \
--color=bg+:#363A4F,bg:#24273A,spinner:#F4DBD6,hl:#ED8796 \
--color=fg:#CAD3F5,header:#ED8796,info:#C6A0F6,pointer:#F4DBD6 \
--color=marker:#B7BDF8,fg+:#CAD3F5,prompt:#C6A0F6,hl+:#ED8796 \
--color=selected-bg:#494D64 \
--color=border:#6E738D,label:#CAD3F5"

zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

if type fzf &>/dev/null; then
  _fzf_lazy() { eval "$(fzf --zsh)"; unfunction _fzf_lazy }
  add-zsh-hook precmd _fzf_lazy
fi

#
# Utils
#

export FQDN=$(hostname -f 2> /dev/null)
alias myip=curl http://api.ipify.org 2> /dev/null


if [ -f $HOME/.cargo/env ]; then
  source "$HOME/.cargo/env"
fi

if type zoxide &>/dev/null; then
  _zoxide_lazy() { eval "$(zoxide init --cmd z zsh)"; unfunction _zoxide_lazy }
  add-zsh-hook precmd _zoxide_lazy
fi

# zprof
