-- leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap

-- use jj to escape insert mode
keymap.set("i", "jj", "<ESC>")

-- Save file
keymap.set("i", "<C-s>", ":w<CR>")
keymap.set("n", "<C-s>", ":w<CR>")

-- buffers
keymap.set("n", "<leader>to", ":enew<CR>")

-- window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height

-- set spelling
keymap.set("n", "<leader>sp", ":set spell!<CR>")

-- window navigation
keymap.set("n", "<C-h>", "<C-w>h")
keymap.set("n", "<C-j>", "<C-w>j")
keymap.set("n", "<C-k>", "<C-w>k")
keymap.set("n", "<C-l>", "<C-w>l")

-- toggle wrap
keymap.set("n", "<leader>z", ":set wrap!<CR>")

-- NvimTreeToggle
keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>")

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags

-- markdown preview
keymap.set("n", "<leader>mp", ":MarkdownPreview<CR>")

-- F5 key to run python
keymap.set("n", "<F5>", "<Esc>:w<CR>:!clear;python3 %<CR>")
