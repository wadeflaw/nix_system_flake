local wezterm = require("wezterm")
local act = wezterm.action

function scheme_for_appearance(appearance)
	if appearance:find("Dark") then
		return "Catppuccin Mocha"
	else
		return "Catppuccin Frappe"
		-- normally this should be latte, but wezterm
		-- fails to find the correct appearrance and defaults to latte everywhere for whatever reason
	end
end

return {
	check_for_updates = false,

	font = wezterm.font("monospace", { weight = "Regular", stretch = "Normal", style = "Normal" }),
	font_size = 14,
	audible_bell = "Disabled",
	color_scheme = scheme_for_appearance(wezterm.gui.get_appearance()),
	enable_tab_bar = true,
	hide_tab_bar_if_only_one_tab = true,
	default_cursor_style = "SteadyUnderline",
	window_background_opacity = 0.9,

	window_padding = {
		left = 20,
		right = 20,
		top = 20,
		bottom = 20,
	},
	exit_behavior = "CloseOnCleanExit",
	mouse_bindings = {
		-- Scrolling up while holding CTRL increases the font size
		{
			event = { Down = { streak = 1, button = { WheelUp = 1 } } },
			mods = "CTRL",
			action = act.IncreaseFontSize,
		},

		-- Scrolling down while holding CTRL decreases the font size
		{
			event = { Down = { streak = 1, button = { WheelDown = 1 } } },
			mods = "CTRL",
			action = act.DecreaseFontSize,
		},
	},
}
