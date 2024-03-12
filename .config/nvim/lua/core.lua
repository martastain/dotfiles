-- Core settings for neovim

vim.opt.termguicolors = true

vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

vim.opt.number = true
vim.opt.showmode = false
vim.opt.laststatus = 3

vim.opt.clipboard = "unnamedplus"
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.mouse = "a"

vim.opt.signcolumn='yes:1'

-- No backup but long undohistory
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv('HOME') .. '/.cache/nvim/undodir'
vim.opt.undofile = true
