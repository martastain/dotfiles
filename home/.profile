# ~/.profile: executed by the command interpreter for login shells.

umask 002

# Include .bashrc if running bash
if [ -n "$BASH_VERSION" ]; then
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi
