local wezterm = require("wezterm")
local config = wezterm.config_builder()
config.default_prog = { 'zsh' }
config.color_scheme = 'Vs Code Dark+ (Gogh)'
config.font_size = 14
config.font = wezterm.font("ComicShannsMono Nerd Font")
config.enable_tab_bar = true
config.window_decorations = "RESIZE"
config.enable_tab_bar = true
config.use_fancy_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = 0.80
config.macos_window_background_blur = 20
config.adjust_window_size_when_changing_font_size = false
config.colors = {
  cursor_bg = '#ffffff',
  cursor_fg = 'black',
  cursor_border = '#ffffff',
}
return config
