local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.audible_bell = "Disabled" -- don't make a sound when the "bell" rings
config.color_scheme = "tokyonight"
config.cursor_blink_rate = 0 -- stop the cursor from blinking
config.font = wezterm.font("JetBrainsMono Nerd Font Propo")
config.font_size = 12.0
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" } -- turn off ligatures
config.hide_tab_bar_if_only_one_tab = true -- hide the tab bar if there is only one tab
config.keys = {
	{
		-- turn off the confirmation menu for exiting tab
		key = "w",
		mods = "CMD",
		action = wezterm.action.CloseCurrentTab({ confirm = false }),
	},
}
config.macos_window_background_blur = 20
config.max_fps = 120
config.window_background_opacity = 0.85
config.window_close_confirmation = "NeverPrompt" -- turn off the confirmation menu for exiting WezTerm
config.window_decorations = "RESIZE" -- removes the title bar of the window
config.window_padding = {
	-- changes the padding on all sides
	left = 6,
	right = 6,
	top = 6,
	bottom = 6,
}

return config
