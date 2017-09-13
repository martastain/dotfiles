# ~/.profile: executed by the command interpreter for login shells.

if [ "$(id -u)" != "0" ]; then
    umask 002
fi

# Include .bashrc if running bash
if [ -n "$BASH_VERSION" ]; then
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi
