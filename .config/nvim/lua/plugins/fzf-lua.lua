return {
  {
    'ibhagwan/fzf-lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    lazy = false,
    opts = {
      previewers = {
        builtin = {
          extensions = {
            ['png'] = { 'chafa' },
            ['jpg'] = { 'chafa' },
          },
        },
      },
      fzf_opts = {
        ['--cycle'] = false,
      },
      files = {
        cwd_prompt = false,
        -- formatter = 'path.filename_first',
      },
      buffers = {
        cwd_prompt = false,
        -- formatter = 'path.filename_first',
      },
    },
    config = function(_, opts)
      local fzflua = require 'fzf-lua'
      fzflua.register_ui_select() -- register fzflua as vim.ui.select
      fzflua.setup(opts)
    end,
    keys = {
      { '<leader>sk',      '<cmd>FzfLua keymaps<CR>',              desc = 'Search [k]eymaps' },
      { '<leader>sm',      '<cmd>FzfLua marks<CR>',                desc = 'Search [m]arks' },
      { '<leader>sM',      '<cmd>FzfLua manpages<CR>',             desc = 'Search [M]an-pages' },
      { '<leader>sh',      '<cmd>FzfLua helptags<CR>',             desc = 'Search [H]elptags' },
      { '<leader>sd',      '<cmd>FzfLua diagnostics_document<CR>', desc = 'Search [d]iagnostics' },
      { '<leader>sw',      '<cmd>FzfLua grep_cWord<CR>',           desc = 'Search current [w]ord' },
      { '<leader>f.',      '<cmd>FzfLua oldfiles<CR>',             desc = 'Search oldfiles' },

      -- Muscle memory bindings
      { '<leader>ff', '<cmd>FzfLua files<CR>',                desc = 'Find files' },
      { '<leader>fw', '<cmd>FzfLua live_grep_native<CR>',     desc = 'Grep project' },

      -- Search in current buffer
      { '<leader>/',  '<cmd>FzfLua blines<CR>',               desc = 'FuzzyFind [b]uffer' },
      --
      -- Search open buffers
      { '<leader>,',       '<cmd>FzfLua buffers<CR>',              desc = 'Search buffers' },

      -- Resume last fzf
      { '<leader><space>', '<cmd>FzfLua resume<CR>',               desc = 'Search [R]esume' },

      -- VSCode like
      { '<C-p>',           '<cmd>FzfLua files<CR>',                desc = 'Find files' },
      { '<C-S-p>',         '<cmd>FzfLua commands<CR>',             desc = 'Search commands' },
    },
  },

}
