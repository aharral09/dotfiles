return {
	{
		"williamboman/mason.nvim",
    lasy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      ensure_installed = {"lua_ls", "ansiblels", "bashls", "dockerls", "marksman", "clangd"},
      auto_install = true,
    },
	},
	{
		"neovim/nvim-lspconfig",
    lazy = false,
		config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
        capabilities  = capabilities
      })
			lspconfig.clangd.setup({
        capabilities  = capabilities
      })
			lspconfig.bashls.setup({
        capabilities  = capabilities
      })
      lspconfig.ansiblels.setup({
        filetypes = { "yaml", "yml" },
        root_dir = lspconfig.util.root_pattern("ansible", "playbooks"),
        capabilities  = capabilities
      })
      lspconfig.marksman.setup({})
			vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
			vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
		end,
	},
}
