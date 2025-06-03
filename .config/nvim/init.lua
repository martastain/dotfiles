require "config.options"
require "config.autocmds"
require "config.lazy"
require "config.keymaps"

local ts_server = vim.g.lsp_typescript_server or "ts_ls" -- "ts_ls" or "vtsls" for TypeScript

vim.lsp.enable {
  ts_server,
  "lua_ls",
  "biome",
  "json",
  "pyright",
  "ruff",
  "tailwindcss",
}

-- Load Lsp on-demand, e.g: eslint is disable by default
-- e.g: We could enable eslint by set vim.g.lsp_on_demands = {"eslint"}
if vim.g.lsp_on_demands then
  vim.lsp.enable(vim.g.lsp_on_demands)
end
