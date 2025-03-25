return {
--  "ellisonleao/gruvbox.nvim",
--  priority = 1000,
--  lazy = false,
--  config = function()
--    require("gruvbox").setup({
--      transparent_mode = true,
--    })
--  	vim.cmd([[colorscheme gruvbox]])
--  end
    "gmr458/vscode_modern_theme.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("vscode_modern").setup({
            cursorline = false,
            transparent_background = true,
            nvim_tree_darker = false,
        })
        vim.cmd.colorscheme("vscode_modern")
    end,
}
