-- set leader key to space
--
vim.g.mapleader = " "

-- Buffers / tabs
-- Use tab and shift-tab to navigate between buffers
-- Use ctrl-x to close a buffer

vim.keymap.set('n', '<leader>x', ':bd<CR>', {silent = true})
vim.keymap.set('n', '<tab>', ':bnext<CR>', {silent = true})
vim.keymap.set('n', '<s-tab>', ':bprev<CR>', {silent = true})

-- Navigate between windows

vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

-- I hate page up and page down default behavior

vim.keymap.set('n', '<PageUp>', '25<Up>')
vim.keymap.set('n', '<PageDown>', '25<Down>')
vim.keymap.set('v', '<PageUp>', '25<Up>')
vim.keymap.set('v', '<PageDown>', '25<Down>')

-- Indent/unindent visual block and keep selection

vim.keymap.set('v', '<', '<gv', {silent = true})
vim.keymap.set('v', '>', '>gv', {silent = true})


-- Git commands are prefixed with <leader>g
-- <leader>gb: git blame
-- <leader>gp: git preview hunk
-- <leader>gt: git toggle current line blame

vim.keymap.set('n', '<leader>gb', ':Gitsigns blame_line<CR>', {silent = true})
vim.keymap.set('n', '<leader>gt', ':Gitsigns toggle_current_line_blame<CR>' )
vim.keymap.set('n', '<leader>gp', ':Gitsigns preview_hunk<CR>', {silent = true})

-- Lsp
-- <leader>ld: go to definition
-- <leader>lr: find references
-- <leader>la: code action
-- <leader>lf: format code

vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "<leader>ld", vim.lsp.buf.definition, {})
vim.keymap.set("n", "<leader>lr", vim.lsp.buf.references, {})
vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, {})
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, {})

-- Neotree
-- Toggle neotree with <C-n> or <C-o>

vim.keymap.set("n", "<C-n>", ":Neotree filesystem toggle left<CR>", {silent = true})
vim.keymap.set("n", "<C-o>", ":Neotree filesystem toggle left<CR>", {silent = true})


-- Magical move highlighted lines
vim.keymap.set('v', '<A-Down>', ":m '>+1<CR>gv=gv", { desc = 'Move selection down', silent = true })
vim.keymap.set('v', '<A-Up>', ":m '<-2<CR>gv=gv", { desc = 'Move selection up', silent = true })
