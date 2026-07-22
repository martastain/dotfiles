require "config.options"
require "config.autocmds"
require "config.lazy"
require "config.keymaps"

vim.opt.termguicolors = true

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
