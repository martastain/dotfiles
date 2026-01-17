local completion = vim.g.completion_mode or "blink" -- or 'native'
-- local completion = vim.g.completion_mode or 'native'

return {
  {
    "saghen/blink.cmp",
    event = "InsertEnter",
    enable = completion == "blink",
    version = "1.*",
    opts = {
      -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
      -- 'super-tab' for mappings similar to vscode (tab to accept)
      -- 'enter' for enter to accept
      -- 'none' for no mappings
      --
      -- All presets have the following mappings:
      -- C-space: Open menu or open docs if already open
      -- C-n/C-p or Up/Down: Select next/previous item
      -- C-e: Hide menu
      -- C-k: Toggle signature help (if signature.enabled = true)
      --
      -- See :h blink-cmp-config-keymap for defining your own keymap
      keymap = { preset = "enter" },
      completion = {
        -- Controls whether the documentation window will automatically show when selecting a completion item
        documentation = {
          auto_show = true,
        },
        menu = {
          border = "rounded",
          winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,CursorLine:BlinkCmpDocCursorLine,Search:None",
        },
      },
      -- Snippets are annoying
      snippets = {},

      -- Experimental signature help support
      signature = { enabled = true },

      sources = { default = { "lsp", "path", "buffer" } },

      -- Disable cmdline completions
      cmdline = { enabled = false, },

      -- Disable per file type
      -- enabled = function()
      --   return not vim.tbl_contains({ "copilot-chat" }, vim.bo.filetype)
      --     and not vim.tbl_contains({ "codecompanion" }, vim.bo.filetype)
      --     and vim.bo.buftype ~= "prompt"
      --     and vim.b.completion ~= false
      -- end,
    },
    -- without having to redefine it
    -- opts_extend = {
    --   "sources.completion.enabled_providers",
    --   "sources.compat", -- Support nvim-cmp source
    --   "sources.default",
    -- },
  },
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      spec = {
        { "<leader>d", group = "debug" },
        { "<leader>r", group = "refactoring", icon = "" },
      },
    },
  },
}
