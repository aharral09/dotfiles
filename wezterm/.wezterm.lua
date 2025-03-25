local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.color_scheme = 'Vs Code Dark+ (Gogh)'
config.font_size = 14
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.enable_tab_bar = true
config.window_decorations = "TITLE | RESIZE"
config.enable_tab_bar = true
config.use_fancy_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = 0.90
config.adjust_window_size_when_changing_font_size = false
config.colors = {
  cursor_bg = '#ffffff',
  cursor_fg = 'black',
  cursor_border = '#ffffff',
}
config.keys = {
  -- This will create a new split and run your default program inside it
  {
    key = '-',
    mods = 'ALT',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  {
    key = '\\',
    mods = 'ALT',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
}
return config
