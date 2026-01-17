require "config.options"
require "config.autocmds"
require "config.lazy"
require "config.keymaps"

vim.lsp.enable {
  "cssls",
  "eslint",
  "html",
  "json",
  "lua_ls",
  "pyright",
  "ruff",
  "tailwindcss",
  "ts_ls",
}
