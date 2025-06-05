local Lsp = require "utils.lsp"
-- uv tool install pyright@latest
return {
  cmd = { "ruff", "server" },
  on_attach = Lsp.on_attach,
  filetypes = { "python" },
  settings = { },
}

