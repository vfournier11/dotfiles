local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_scheme = "Palenight (Gogh)"

config.font = wezterm.font("IosevkaTerm Nerd Font Propo")
config.font_size = 14

config.use_fancy_tab_bar = false

config.inactive_pane_hsb = {
	saturation = 0.8,
	brightness = 0.85,
}

local act = wezterm.action
config.keys = {
	{
		key = "v",
		mods = "CTRL|SHIFT|ALT",
		action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "h",
		mods = "CTRL|SHIFT|ALT",
		action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
}

return config
