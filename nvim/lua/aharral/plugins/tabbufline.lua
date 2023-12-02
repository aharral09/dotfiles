local status, tabbufline = pcall(require, "tabbufline")
if not status then
  return
end
local tabbufline = require("tabbufline")

-- configure lualine with modified theme
tabbufline.setup()

local options = {
  tab_format = " #{n}: #{b}#{f} #{i} ",
  buffer_id_index = false,
  icon_colors = true,
  start_hidden = false,
  auto_hide = false,
  disable_commands = false,
  go_to_maps = true,
  flags = {
      modified = " [+]",
      not_modifiable = " [-]",
      readonly = " [RO]",
  },
  hlgroups = {
      current = "TabLineSel",
      normal = "TabLine",
      active = nil,
      spacing = nil,
      modified_current = nil,
      modified_normal = nil,
      modified_active = nil,
      tabpage_current = nil,
      tabpage_normal = nil,
  },
  show_tabpages = false,
  tabpage_format = " #{n} ",
  tabpage_position = "right",

}
