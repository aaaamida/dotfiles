local wezterm = require('wezterm')
local config = {}

config.colors {
  foreground = '#FFAEAE',
  background = '#000000',

  cursor_bg = '#000000',
  cursor_fg = '#FFAEAE',

  selection_bg = '#1F1E33',
  selection_fg = '#FFFFFF',
}

config.window_background_opacity = 0.8;
config.text_background_opacity = 0.8;

config.font {
  wezterm.font('Hasklug Nerd Font'),
  font_size = 11.0,
}

config.window_decorations = "NONE" 


return config
