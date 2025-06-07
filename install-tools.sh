#!/bin/bash

# Check if mise is installed, if not install it
if ! command -v mise &> /dev/null; then
    echo "Installing mise..."
    curl https://mise.run | sh
    mise activate
fi

mise use \
  deno \
  dust \
  jq \
  fzf \
  gh \
  lua-language-server \
  neovim \
  node:lts \
  python:3.13 \
  rg \
  uv \
  yarn

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
uv tool install isort
uv tool install pyright
uv tool install ruff
