require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "ansiblels", "lua_ls", "rust_analyzer" },
    automatic_installation = true
})


require("lspconfig").lua_ls.setup {}
local lspconfig = require('lspconfig')
lspconfig.ansiblels.setup {
    filetypes = { "yaml", "yml", "ansible" },
    root_dir = lspconfig.util.root_pattern("ansible", "playbooks")
}
