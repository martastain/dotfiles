return {
  "folke/zen-mode.nvim",
  lazy = false,
  config = function()
    require("zen-mode").setup {
      window = {
        backdrop = 0.95,
        width = 120, -- width of the Zen window
        height = 1, -- height of the Zen window
        options = {
          signcolumn = "no", -- disable signcolumn
          number = false, -- disable number column
          relativenumber = false, -- disable relative numbers
          cursorline = false, -- disable cursorline
          cursorcolumn = false, -- disable cursor column
          foldcolumn = "0", -- disable fold column
          list = false, -- disable whitespace characters
        },
      },
      plugins = {
        gitsigns = { enabled = false },
        tmux = { enabled = false },
        twilight = { enabled = false },
      },
      on_open = function()
        vim.cmd[[set foldlevel=20]]
      end,
      on_close = function()
        vim.cmd[[set foldlevel=0]]
      end,
    }
  end,

}

