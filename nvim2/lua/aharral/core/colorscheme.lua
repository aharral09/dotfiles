-- set colorscheme to gruvbox with protected call
-- in case it isn't installed
require("gruvbox").setup({
    transparent_mode = true,
  })
  local status, _ = pcall(vim.cmd, "colorscheme gruvbox")
  
require("dracula").setup({
    transparent_mode = true,
  })
local status, _ = pcall(vim.cmd, "colorscheme dracula")
  --require("catppuccin").setup({
  --   transparent_background = true,
  --})
  --local status, _ = pcall(vim.cmd, "colorscheme catppuccin")
  if not status then
    print("Colorscheme not found!") -- print error if colorscheme not installed
    return
  end
