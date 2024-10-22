require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "rust_analyzer" },
    automatic_installation = true
})


require("lspconfig").lua_ls.setup {}
