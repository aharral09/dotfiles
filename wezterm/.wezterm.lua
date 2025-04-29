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
config.window_background_opacity = 0.85
config.macos_window_background_blur = 50
config.adjust_window_size_when_changing_font_size = false
config.colors = {
  cursor_bg = '#ffffff',
  cursor_fg = 'black',
  cursor_border = '#ffffff',
}
local act = wezterm.action
config.keys = {
  {
    key = '-',
    mods = 'ALT',
    action = act.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  {
    key = '\\',
    mods = 'ALT',
    action = act.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'f',
    mods = 'ALT',
    action = act.SendString 'tmux-sessionizer\n'
  },
  {
    key = 'h',
    mods = 'ALT',
    action = act.ActivatePaneDirection 'Left'
  },
  {
    key = 'j',
    mods = 'ALT',
    action = act.ActivatePaneDirection 'Down',
  },
  {
    key = 'k',
    mods = 'ALT',
    action = act.ActivatePaneDirection 'Up',
  },
  {
    key = 'l',
    mods = 'ALT',
    action = act.ActivatePaneDirection 'Right',
  },
}
return config
