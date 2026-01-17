return {
  "zbirenbaum/copilot.lua",
  event = "InsertEnter",
  config = function()
    vim.defer_fn(function()
      require("copilot").setup {
        filetypes = { markdown = true },
        suggestion = {
          enabled = true,
          auto_trigger = true,
          debounce = 75,
          keymap = {
            accept = "<M-l>",
            accept_word = "<M-k>",
            next = "M-]",
            prev = "M-[",
          },
        },
      }
    end, 100)
  end,
}

