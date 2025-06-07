return {
  {
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
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" },
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
      -- See Configuration section for options
    },
  },
}


