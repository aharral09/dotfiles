vim.g.mapleader = " "
local map = vim.keymap.set

-- visual line movement
map("n", "j", "gj")
map("n", "k", "gk")

-- use jj to escape insert mode
map("i", "jj", "<ESC>")
map("i", "jk", "<ESC>")
map("i", "<C-c>", "<ESC>")

-- Save file
map("i", "<C-s>", ":w<CR>")
map("n", "<C-s>", ":w<CR>")
map("n", "<leader>w", ":w<CR>")
map("n", "<leader>q", ":q<CR>")
map("n", "<leader>Q", ":qa!<CR>")
map("n", "<leader>wq", ":wq<CR>")
map("n", "<leader>wqa", ":wqa<CR>")

-- New file
map("n", "<C-t>", ":ene <BAR> startinsert <CR>")

-- window management
map("n", "<leader>sv", "<C-w>v") -- split window vertically
map("n", "<leader>sh", "<C-w>s") -- split window horizontally
map("n", "<leader>se", "<C-w>=") -- make split windows equal width & height

-- set spelling
map("n", "<leader>sp", ":set spell!<CR>")

-- window navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- toggle wrap
map("n", "<leader>sw", ":set wrap!<CR>")

-- Neotree
map("n", "<leader>e", ":Neotree toggle left<CR>")

-- telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
map("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
map("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags

-- markdown preview
map("n", "<leader>mp", ":MarkdownPreview<CR>")

-- buffers
map("n", "<leader>bb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
map("n", "bn", ":bn<CR>")
map("n", "bp", ":bp<CR>")
map("n", "<C-w>", ":BufferClose<CR>")

-- lazygit
map("n", "<leader>lg", ":LazyGit<CR>")

-- yazi
map("n", "<leader>y", ":Yazi<CR>")