return {
  "Mofiqul/vscode.nvim",
  lazy = false,
  config = function()
    require("vscode").setup({
      transparent = true,
      disable_nvimtree_bg = true,
    })
    vim.cmd.colorscheme("vscode")
  end,
}
