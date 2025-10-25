#!/bin/bash

# Check if mise is installed, if not install it
if ! command -v mise &> /dev/null; then
    echo "Installing mise..."
    curl https://mise.run | sh
    mise activate
fi

mise install

#
# Install npm packages
#

echo "Installing npm packages..."
npm install -g \
  @antfu/ni \
  @fsouza/prettierd \
  @mermaid-js/mermaid-cli \
  @tailwindcss/language-server \
  @vtsls/language-server \
  oxlint \
  pnpm \
  prettier \
  rustywind \
  typescript-language-server \
  typescript \
  vscode-langservers-extracted

# Install tools with uv
echo "Installing tools with uv..."
uv tool install pyright
uv tool install ruff
