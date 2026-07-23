martastain's dotfiles
=====================

Install base packages and make zsh the default shell

```bash
apt-get install -y git zsh build-essential stow tmux httpie curl fuse
chsh -s /usr/bin/zsh
```

Install and mise

```bash
curl -sS https://starship.rs/install.sh | sh
curl https://mise.run | sh
```

Deploy dotfiles

```bash
rm ~/.zshrc
git clone https://github.com/martastain/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
stow .
```

Now log out and log in again

Ensure mise is set up correctly

```bash
mise trust
mise install
./install-tools.sh
```

### Tmux

- `C-a` is the prefix key.
- Navigation between panes is done with `C+PgUp` and `C+PgDown`.
- New pane is created with `C+t`

### Git 

Sane git settings:

```bash
git config --global init.defaultBranch main
git config --global push.default current
```
