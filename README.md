martastain's dotfiles
=====================

Highly opinionated dotfiles for my development environment.

- zsh + oh-my-zsh + starship.rs
- tmux
- neovim
- mise for python/node version management
- poetry for python package management
- ghcli for github management
- copilot

## Installation

Use nerdfonts! (FiraCode Nerd Font is my favorite).
Terminal emulator configuration and GUI goodies are not included in this repo.

### Base packages

```bash
apt-get install -y git zsh build-essential stow jq tmux httpie curl ripgrep exa
```

### Starship.rs

```bash
curl -sS https://starship.rs/install.sh | sh
curl https://mise.run | sh
```

### Oh-my-zsh

```bash
curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | sh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

## Deploy dotfiles

And set your shell to zsh

```bash
rm ~/.zshrc
git clone https://github.com/martastain/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
stow .
chsh -s /bin/bash
```

Log out and log in again

Then download node and python in order to run Neovim language servers

```bash
mise use --global node@22
mise use --global python@3.12
```

### Neovim

```
sudo curl -fLo /usr/local/bin/nvim $(curl -s https://api.github.com/repos/neovim/neovim/releases/latest | jq -r '.assets[] | select(.name | contains("nvim.appimage")) | .browser_download_url')
sudo chmod +x /usr/local/bin/nvim
```

Neovim config comes with some plugins preconfigured. 
Each plugin (or a logical group of plugins) is managed by 
a separate file in `.config/nvim/lua/plugin` directory. 

To disable a specific plugin, just remove the file.

Check `.config/nvim/mappings.lua` for keybindings.

#### LSP

LSP is configured for sane (and some not so sane) languages:

- Python (pyright + ruff) 
- Javascript/typescript (tsserver, eslint)
- Lua 
- Rust

### Tmux

- `C-a` is the prefix key.
- Navigation between panes is done with `C+PgUp` and `C+PgDown`.
- New pane is created with `C+t`


### Poetry


### Git / Github 

Github CLI

```bash
(type -p wget >/dev/null || (sudo apt update && sudo apt-get install wget -y)) \
&& sudo mkdir -p -m 755 /etc/apt/keyrings \
&& wget -qO- https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
&& sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& sudo apt update \
&& sudo apt install gh -y
```

Sane git settings:

```bash
git config --global init.defaultBranch main
git config --global push.default current
```
