return {
	{
		"williamboman/mason.nvim",
    lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      ensure_installed = {"lua_ls", "ansiblels", "bashls", "dockerls", "marksman"},
      auto_install = true,
    },
	},
	{
		"neovim/nvim-lspconfig",
    lazy = false,
		config = function()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({})
      lspconfig.ansiblels.setup({
        filetypes = { "yaml", "yml" },
        root_dir = lspconfig.util.root_pattern("ansible", "playbooks")
      })
      lspconfig.marksman.setup({})
			vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
			vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
		end,
	},
}
