return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',

  config = function ()
    require("bufferline").setup({
      highlights = {
        buffer_selected = {
          bold = false
        },
      },
      options = {
        separator_style = "none",
        indicator_icon = ' ',
        show_buffer_close_icon = false,
        diagnostics = false,
        color_icons = false,
        show_close_icons = false,
      }

    })
  end
}
