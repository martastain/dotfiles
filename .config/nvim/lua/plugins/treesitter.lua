return {  
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local config = require("nvim-treesitter.configs")
      config.setup({
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
        ensured_installed = {
          "bash",
          "c",
          "comment",
          "css",
          "html",
          "javascript",
          "jsdoc",
          "jsonc",
          "lua",
          "markdown",
          "markdown_inline",
          "python",
          "regex",
          "rust",
          "scss",
          "sql",
          "toml",
          "typescript",
          "vim",
          "yaml",
        },
      })
    end
  }
}
