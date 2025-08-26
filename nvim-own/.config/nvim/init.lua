-- options
vim.o.number = true
vim.o.relativenumber = true
vim.o.tabstop = 2
vim.o.tabstop = 2
vim.o.swapfile = false
vim.g.mapleader = " "
vim.o.signcolumn = "yes"
vim.o.winborder = "rounded"
vim.o.mouse = "a"
vim.o.clipboard = "unnamedplus"

-- plugins
vim.pack.add({
	{ src = "https://github.com/Mofiqul/vscode.nvim" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/echasnovski/mini.pick" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },
	{ src = "https://github.com/windwp/nvim-autopairs" },
})

-- auto pairs
require "nvim-autopairs".setup()

-- colorscheme
require('vscode').setup({ transparent = true, })
vim.cmd("colorscheme vscode")
vim.cmd(":hi statusline guibg=NONE")

-- standard keymaps
vim.keymap.set('n', '<leader>r', ':update<CR> :source<CR>')
vim.keymap.set('n', '<leader>w', ':write<CR>')
vim.keymap.set('n', '<leader>q', ':quit<CR>')
vim.keymap.set('n', '<leader>rh', ':nohl<CR>')
vim.keymap.set('i', 'jj', '<ESC>')
vim.keymap.set({ 'n', 'v', 'x' }, '<leader>y', '"+y<CR>')
vim.keymap.set({ 'n', 'v', 'x' }, '<leader>d', '"+d<CR>')

-- lsp
vim.lsp.enable({ "lua_ls", "bashls", "ansiblels", "marksman" })
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)

-- autocomplete
vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client:supports_method('textDocument/completion') then
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
		end
	end,
})
vim.cmd("set completeopt+=noselect")

-- mini
require "mini.pick".setup()
vim.keymap.set('n', '<leader>f', ":lua require('mini.pick').builtin.cli({ command = { 'rg', '--files', '--hidden', '-g', '!.git' }})<CR>")
vim.keymap.set('n', '<leader>b', ":Pick buffers<CR>")
vim.keymap.set('n', '<leader>s', ":Pick grep_live<CR>")
vim.keymap.set('n', '<leader>h', ":Pick help<CR>")

-- oil
require "oil".setup({
	view_options = {
		show_hidden = true,
	}
})
vim.keymap.set('n', '<leader>o', ":Oil<CR>")

























