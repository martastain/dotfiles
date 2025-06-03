require "config.options"
require "config.autocmds"
require "config.lazy"
require "config.keymaps"


local ts_server = vim.g.lsp_typescript_server or "ts_ls" -- "ts_ls" or "vtsls" for TypeScript

-- Enable LSP servers for Neovim 0.11+
vim.lsp.enable {
  ts_server,
  "lua_ls", -- Lua
  "biome", -- Biome = Eslint + Prettier
  "json", -- JSON
  "pyright", -- Python
  "ruff",
  "tailwindcss", -- Tailwind CSS
}

-- Load Lsp on-demand, e.g: eslint is disable by default
-- e.g: We could enable eslint by set vim.g.lsp_on_demands = {"eslint"}
if vim.g.lsp_on_demands then
  vim.lsp.enable(vim.g.lsp_on_demands)
end
