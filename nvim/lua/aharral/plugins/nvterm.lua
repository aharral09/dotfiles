-- import nvterm plugin safely
local status, nvterm = pcall(require, "nvterm")
if not status then
  return
end

-- configure nvterm with options
nvterm.setup()

local terminal = require("nvterm.terminal")

local toggle_modes = {'n', 't'}

local mappings = {
  { toggle_modes, '<leader>th', function () terminal.toggle('horizontal') end },
  { toggle_modes, '<leader>tv', function () terminal.toggle('vertical') end },
  { toggle_modes, '<leader>tf', function () terminal.toggle('float') end },
}

local opts = { noremap = true, silent = true }
for _, mapping in ipairs(mappings) do
  vim.keymap.set(mapping[1], mapping[2], mapping[3], opts)
end
