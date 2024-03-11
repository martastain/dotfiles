-- Everything related to LSP configuration
-- except for the null-ls configuration

return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup({
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
      ensure_installed = {
        "lua_ls",
        "pyright",
        "ruff_lsp",
        "rust_analyzer",
        "tsserver",
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

      lspconfig.ruff_lsp.setup {
        capabilities = capabilities,
        settings = {
          cmd = { "ruff-lsp", "--stdio" },
          filetypes = { "python" },
        }
      }

      lspconfig.rust_analyzer.setup({
        capabilities = capabilities
      })

      lspconfig.tsserver.setup({
        capabilities = capabilities
      })


    end,
  },
}
