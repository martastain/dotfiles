return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require('gitsigns').setup({
      signs       = {
        add = { text = "│" },
        change = { text = "│" },
        delete = { text = "󰍵" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "│" },
      },

      signcolumn  = true, -- Toggle with `:Gitsigns toggle_signs`
      numhl       = false, -- Toggle with `:Gitsigns toggle_numhl`
      auto_attach = true,
    })
  end
}
