-- Indent Blankline Configuration
-- Shows indentation levels with thin vertical lines

return {
  "lukas-reineke/indent-blankline.nvim",
  config = function()

    require("ibl").setup {
      indent = {
        char = "▏",
      },
      whitespace = {
        remove_blankline_trail = false,
      },
      scope = { enabled = false },
    }
  end,
}
