local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.color_scheme = 'GruvboxDarkHard'
config.font_size = 14
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.enable_tab_bar = true
config.use_fancy_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = 0.90
config.macos_window_background_blur = 10
config.native_macos_fullscreen_mode = true
config.adjust_window_size_when_changing_font_size = false

return config
