local map = vim.keymap.set

-- All time favorite keymaps
map('n', '<PageUp>', '25<Up>')
map('n', '<PageDown>', '25<Down>')
map('v', '<PageUp>', '25<Up>')
map('v', '<PageDown>', '25<Down>')

map('n', '<leader>x', ':bd<CR>', {silent = true})
map('n', '<tab>', ':bnext<CR>', {silent = true})
map('n', '<s-tab>', ':bprev<CR>', {silent = true})

map("n", "<C-n>", ":Neotree filesystem toggle left<CR>", {silent = true})
map("n", "<C-o>", ":Neotree filesystem toggle left<CR>", {silent = true})

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and Clear hlsearch" })

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- commenting
map("n", "gco", "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Below" })
map("n", "gcO", "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Above" })

-- quit
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })

-- Terminal Mappings
map("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })
map("t", "<C-h>", "<cmd>wincmd h<cr>", { desc = "Go to Left Window" })
map("t", "<C-j>", "<cmd>wincmd j<cr>", { desc = "Go to Lower Window" })
map("t", "<C-k>", "<cmd>wincmd k<cr>", { desc = "Go to Upper Window" })
map("t", "<C-l>", "<cmd>wincmd l<cr>", { desc = "Go to Right Window" })
map("t", "<C-/>", "<cmd>close<cr>", { desc = "Hide Terminal" })
map("t", "<c-_>", "<cmd>close<cr>", { desc = "which_key_ignore" })

map("n", "<A-v>", "<cmd>vsplit | terminal<cr>i", { desc = "Vertical Split Terminal" })
map("n", "<A-h>", "<cmd>split | terminal<cr>i", { desc = "Horizontal Split Terminal" })


-- windows
map("n", "<leader>ww", "<C-W>p", { desc = "Other Window", remap = true })
map("n", "<leader>wd", "<C-W>c", { desc = "Delete Window", remap = true })
map("n", "<leader>w-", "<C-W>s", { desc = "Split Window Below", remap = true })
map("n", "<leader>w|", "<C-W>v", { desc = "Split Window Right", remap = true })
map("n", "<leader>-", "<C-W>s", { desc = "Split Window Below", remap = true })
map("n", "<leader>|", "<C-W>v", { desc = "Split Window Right", remap = true })

-- tabs
map("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
map("n", "<leader><tab>o", "<cmd>tabonly<cr>", { desc = "Close Other Tabs" })
map("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
map("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
map("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })

-- Silent keymap option
local opts = { silent = true }

-- remap "p" in visual mode to delete the highlighted text without 
-- overwriting yanked text, and then paste the content from the unnamed register.
map("v", "p", '"_dP', opts)

-- Copy whole file content to clipboard with C-c
map("n", "<C-c>", ":%y+<CR>", opts)

-- Select all text in buffer with Alt-a
map("n", "<A-a>", "ggVG", { noremap = true, silent = true, desc = "Select all" })

-- Move visual selection up and down with Alt-Up and Alt-Down
map("v", "<A-Down>", ":m '>+1<CR>gv=gv", opts)
map("v", "<A-Up>", ":m '<-2<CR>gv=gv", opts)


-- Git
map('n', '<leader>gb', ':Gitsigns blame_line<CR>', {silent = true})
map('n', '<leader>gt', ':Gitsigns toggle_current_line_blame<CR>' )
map('n', '<leader>gp', ':Gitsigns preview_hunk<CR>', {silent = true})
