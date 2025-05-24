-- Everything related to LSP configuration
-- except for the null-ls configuration

return {
  { "mason-org/mason.nvim", opts = {} },
  {
    "mason-org/mason-lspconfig.nvim",
    lazy = false,
    dependencies = { 'neovim/nvim-lspconfig' },
    opts = {
      auto_install = true,
      ensure_installed = {
        "bashls",
        "lua_ls",
        "eslint",
        "pyright",
        "ruff",
        "rust_analyzer",
        "ts_ls",
      }
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lspconfig = require("lspconfig")

      --
      -- LSP servers
      --

      lspconfig.html.setup({
        capabilities = capabilities
      })

      -- lspconfig.eslint.setup({
      --   capabilities = capabilities,
      --   settings = {
      --     lintOnSave = true,
      --     formatOnSave = true,
      --   }
      -- })

      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" }
            }
          }
        }
      })

      lspconfig.pyright.setup({
        capabilities = capabilities,
        settings = {
          python = {
            analysis = {
              autoSearchPaths = true,
              typeCheckingMode = "basic",
              useLibraryCodeForTypes = true,
            },
          },
        },
      })

      lspconfig.ruff.setup({
        capabilities = capabilities,
        settings = {
          filetypes = { "python" },
        }
      })

      lspconfig.rust_analyzer.setup({
        capabilities = capabilities
      })

      lspconfig.ts_ls.setup({
        capabilities = capabilities
      })

      lspconfig.bashls.setup({
        capabilities = capabilities
      })


    end,
  },
}
