local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.color_scheme = 'Palenight (Gogh)'

config.font_size = 14

config.use_fancy_tab_bar = false

config.inactive_pane_hsb = {
  saturation = 0.8,
  brightness = 0.55,
}

return config

