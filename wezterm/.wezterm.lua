local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.color_scheme = 'GruvboxDarkHard'
config.font_size = 11
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.enable_tab_bar = true
config.window_decorations = "TITLE | RESIZE"
config.enable_tab_bar = true
config.use_fancy_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = 0.90
config.adjust_window_size_when_changing_font_size = false

return config
