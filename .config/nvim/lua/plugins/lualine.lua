return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require("lualine").setup({

      options = {
        icons_enabled = true,
        theme = "onedark",
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
        always_divide_middle = true,
        globalstatus = true,
      },

      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diagnostics" },
        lualine_c = { "filename" },
        lualine_x = { "fileformat", "filetype" }, --{'encoding', 'fileformat', 'filetype'},
        lualine_y = {},                       --'progress'},
        lualine_z = { "location" },
      },
    })
  end,
}
