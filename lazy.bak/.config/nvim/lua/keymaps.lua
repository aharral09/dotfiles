vim.g.mapleader = " "
local map = vim.keymap.set

-- run script
map("n", "<C-x>", ":!./%<CR>")

-- QOLs
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("i", "jj", "<ESC>")
map("i", "<C-c>", "<ESC>")
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- visual line movement
map("n", "j", "gj")
map("n", "k", "gk")

-- File operations
map("n", "<leader>w", ":w<CR>")
map("n", "<leader>q", ":q<CR>")
map("n", "<leader>qa", ":qa!<CR>")
map("n", "<leader>wq", ":wq<CR>")
map("n", "<leader>wqa", ":wqa<CR>")
map("n", "<C-n>", ":ene <BAR> startinsert <CR>")

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
map("n", "<leader>e", ":NvimTreeToggle<CR>")

-- Oil
map("n", "<leader>o", ":Oil<CR>")

-- telescope
map("n", "<leader>f", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
map("n", "<leader>s", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
map("n", "<leader>c", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
map("n", "<leader>b", "<cmd>Telescope buffers<cr>") -- find string under cursor in current working directory
map("n", "<leader>bn", "<cmd>bn<cr>") -- find string under cursor in current working directory
map("n", "<leader>bp", "<cmd>bp<cr>") -- find string under cursor in current working directory
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags

-- markdown preview
map("n", "<leader>mp", ":MarkdownPreview<CR>")

-- lazygit
map("n", "<leader>lg", ":LazyGit<CR>")

-- yazi
map("n", "<leader>y", ":Yazi<CR>")
