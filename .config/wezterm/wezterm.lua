local wezterm = require("wezterm")
local config = {
	font_size = 14,
	font = wezterm.font_with_fallback({
		{ family = "Maple Mono NF CN", weight = "Regular" },
		"WenQuanYi Micro Hei",
	}),
	initial_cols = 110,
	initial_rows = 35,

	-- color_scheme = "Catppuccin Mocha",
	-- color_scheme = "Tomorrow Night Eighties (Gogh)",
	-- color_scheme = "Flatland",
	-- color_scheme = "Frontend Galaxy (Gogh)",
	-- color_scheme = "Tokyo Night Storm",
	color_scheme = "BlulocoDark",

	use_fancy_tab_bar = false,
	-- window_decorations = "RESIZE",
	window_background_opacity = 0.7,
    kde_window_background_blur = true,
	adjust_window_size_when_changing_font_size = false,

	window_padding = {
		left = 10,
		right = 10,
		top = 5,
		bottom = 5,
	},

	hyperlink_rules = wezterm.default_hyperlink_rules(),


	default_prog = { "zsh" },
	leader = { key = "Space", mods = "CTRL", timeout_milliseconds = 1000 },
	keys = {
		{
			key = "}",
			mods = "CTRL|SHIFT",
			action = wezterm.action.ActivateTabRelative(1),
		},
		{
			key = "{",
			mods = "CTRL|SHIFT",
			action = wezterm.action.ActivateTabRelative(-1),
		},
		{
			key = "L",
			mods = "CTRL|SHIFT",
			action = wezterm.action.SendKey({ key = "End", mods = "NONE" }),
		},
		{
			key = "H",
			mods = "CTRL|SHIFT",
			action = wezterm.action.SendKey({ key = "Home", mods = "NONE" }),
		},
		{
			key = "|",
			mods = "LEADER|SHIFT",
			action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
		},
		{
			key = "-",
			mods = "LEADER",
			action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
		},
		{
			key = "n",
			mods = "SHIFT|CTRL",
			action = wezterm.action.ToggleFullScreen,
		},
	},
}

table.insert(config.hyperlink_rules, {
	regex = "\\b\\w+://(?:[\\w.-]+):\\d+\\S*\\b",
	format = "$0",
})


wezterm.on("update-right-status", function(window, pane)
	-- "Wed Mar 3 08:14"
	local date = wezterm.strftime("%a %b %-d %H:%M ")

	window:set_right_status(wezterm.format({
		{ Text = date },
	}))
end)

return config
