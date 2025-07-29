local wezterm = require("wezterm")
return {
	color_scheme = "Catppuccin Mocha",
	enable_tab_bar = false,
	font_size = 16.0,
	line_height = 1.2,
	initial_cols = 127,
	initial_rows = 30,
	font = wezterm.font("JetBrains Mono"),
	-- macos_window_background_blur = 40,
	macos_window_background_blur = 30,

	-- window_background_opacity = 0.92,
	-- window_background_opacity = 1.0,
	window_background_opacity = 0.78,
	-- window_background_opacity = 0.20,
	window_decorations = "RESIZE",

	default_prog = {
		"/bin/zsh",
		"-l",
		"-c",
		"tmux attach -t main || tmux new -s main",
	},
	mouse_bindings = {
		-- Ctrl-click will open the link under the mouse cursor
		{
			event = { Up = { streak = 1, button = "Left" } },
			mods = "CTRL",
			action = wezterm.action.OpenLinkAtMouseCursor,
		},
	},
}
