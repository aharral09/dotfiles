vim.g.mapleader = " "
local map = vim.keymap.set

-- QOLs
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jj", "<ESC>")
map({ "n", "i", "v" }, "<C-s>", ":w<CR>")
map({"n","v","x"}, "<leader>r", ":update<CR> :source<CR>")
map('n', '<leader>lf', vim.lsp.buf.format)

-- visual line movement
map("n", "j", "gj")
map("n", "k", "gk")

-- File operations
map("n", "<leader>w", ":w<CR>")
map("n", "<leader>q", ":q<CR>")
map("n", "<C-n>", ":ene <BAR> startinsert <CR>")

-- window navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Neotree
map("n", "<leader>e", ":NvimTreeToggle<CR>")

-- Oil
map("n", "<leader>o", ":Oil<CR>")

-- Telescope
map("n", "<leader>f", ":Telescope find_files<CR>") -- find files within current working directory, respects .gitignore
map("n", "<leader>s", ":Telescope live_grep<CR>") -- find string in current working directory as you type
map("n", "<leader>c", ":Telescope grep_string<CR>") -- find string under cursor in current working directory
map("n", "<leader>b", ":Telescope buffers<CR>") -- find string under cursor in current working directory
map("n", "<leader>h", ":Telescope help_tags<CR>") -- list available help tags

-- Buffers
map("n", "<leader>bn", ":bn<CR>")
map("n", "<leader>bp", ":bp<CR>")

-- markdown preview
map("n", "<leader>mp", ":MarkdownPreview<CR>")

-- lazygit
map("n", "<leader>lg", ":LazyGit<CR>")

-- yazi
map("n", "<leader>y", ":Yazi<CR>")
