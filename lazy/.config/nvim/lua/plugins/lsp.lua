return {
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    config = function()
      require("mason-lspconfig").setup()
    end,
    opts = {
      ensure_installed = { "lua_ls", "ansiblels", "bashls", "dockerls", "marksman", "clangd", "jedi_language_server" },
      auto_install = true,
    },
  },
  {
    "williamboman/mason.nvim",
    lasy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lspconfig = require("lspconfig")
      -- lua
      lspconfig.lua_ls.setup({
        capabilities = capabilities
      })
      -- python
      lspconfig.jedi_language_server.setup({
        capabilities = capabilities
      })
      -- C
      lspconfig.clangd.setup({
        capabilities = capabilities
      })
      -- bash
      lspconfig.bashls.setup({
        capabilities = capabilities
      })
      -- ansible
      lspconfig.ansiblels.setup({
        filetypes    = { "yaml", "yml" },
        root_dir     = lspconfig.util.root_pattern("ansible", "playbooks"),
        capabilities = capabilities
      })
      -- markdown
      lspconfig.marksman.setup({})
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
    end,
  },
}
