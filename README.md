martastain's dotfiles
=====================

Highly opinionated dotfiles for my development environment.

- zsh + oh-my-zsh
- tmux
- neovim
- pyenv for python version management
- poetry for python package management
- nvm for node version management
- yarn for node package management
- ghcli for github management
- copilot

## Installation

Use nerdfonts! (FiraCode Nerd Font is my favorite).
Terminal emulator configuration and GUI goodies are not included in this repo.

### Base packages

```bash
apt-get install -y git zsh build-essential stow jq tmux httpie curl ripgrep exa
```

### Oh-my-zsh

```bash
curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
```

TODO: add zsh plugins
-  git
-  poetry
-  autoswitch_virtualenv
-  zsh-autosuggestions
-  dirhistory


### Neovim

```
sudo curl -fLo /usr/local/bin/nvim $(curl -s https://api.github.com/repos/neovim/neovim/releases/latest | jq -r '.assets[] | select(.name | contains("nvim.appimage")) | .browser_download_url')
sudo chmod +x /usr/local/bin/nvim
```

### For development

Install the following:
TODO

- nvm
- pyenv
- poetry
- ghcli

Quality of life settings:

```bash
poetry config virtualenvs.in-project true
git config --global init.defaultBranch main
git config --global push.default current
```

### Deploy dotfiles

```bash
git clone https://github.com/martastain/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
stow .
```

## Neovim

Neovim config comes with some plugins preconfigured. 
Each plugin (or a logical group of plugins) is managed by 
a separate file in `.config/nvim/lua/plugin` directory. 

To disable a specific plugin, just remove the file.

Check `.config/nvim/mappings.lua` for keybindings.

### LSP

LSP is configured for sane (and some not so sane) languages:

- Python (pyright + ruff) 
- Javascript/typescript (tsserver, eslint)
- Lua 
- Rust

## Tmux

- `C-a` is the prefix key.
- Navigation between panes is done with `C+PgUp` and `C+PgDown`.
- New pane is created with `C+t`

