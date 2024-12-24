-- import lualine plugin safely
local status, lualine = pcall(require, "lualine")
if not status then
  return
end

-- get lualine gruvbox theme
local lualine_gruvbox = require("lualine.themes.gruvbox-material")
--local lualine_dracula = require("lualine.themes.dracula-nvim")

-- configure lualine with modified theme
lualine.setup({
  options = {
      --theme = 'dracula-nvim',
      theme = lualine_gruvbox,
      --theme = 'catppuccin'
      sections = {lualine_a = {'buffers','mode'}}
      --theme = 'nordic'
  },
})

