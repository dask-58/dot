vim.g.mapleader = " "

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', '<leader>w', ':w<CR>', opts)
map('n', '<leader>q', ':q<CR>', opts)
map('n', '<leader>x', ':wq<CR>', opts)
map('n', '<leader>c', ':bd<CR>', opts)

-- Split window shortcuts
map('n', '<leader>v', ':vsplit<CR>', opts)
map('n', '<leader>h', ':split<CR>', opts)

-- Navigate splits using Ctrl + arrow keys
map('n', '<C-Left>', '<C-w>h', opts)
map('n', '<C-Down>', '<C-w>j', opts)
map('n', '<C-Up>', '<C-w>k', opts)
map('n', '<C-Right>', '<C-w>l', opts)

-- Move lines up and down
map('n', '<A-j>', ':m .+1<CR>==', opts)
map('n', '<A-k>', ':m .-2<CR>==', opts)

-- Visual mode line move up and down
map('x', '<A-j>', ":m '>+1<CR>gv=gv", opts)
map('x', '<A-k>', ":m '<-2<CR>gv=gv", opts)

map('v', '<leader>y', '"+y', opts)
map('n', '<leader>p', '"+p', opts)
