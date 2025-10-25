return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    { "<leader>cn", "<cmd>ConformInfo<cr>", desc = "Conform Info" },
  },
  opts = {
    -- Define your formatters
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "ruff_format" },
      ["markdown"] = { "prettierd", "prettier", stop_after_first = true },
      ["markdown.mdx"] = { "prettierd", "prettier", stop_after_first = true },
      ["javascript"] = { "prettierd", "prettier", stop_after_first = true },
      ["javascriptreact"] = { "prettierd", "prettier", stop_after_first = true },
      ["typescript"] = { "prettierd", "prettier", stop_after_first = true },
      ["typescriptreact"] = { "prettierd", "prettier", stop_after_first = true },
    },

    -- Set default options
    default_format_opts = {
      lsp_format = "fallback",
    },
  },
  init = function()
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}
