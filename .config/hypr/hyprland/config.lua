local hyprland = hl

hyprland.config({
	misc = {
		force_default_wallpaper = 0,
		disable_hyprland_logo = true,
	},
	scrolling = {
		fullscreen_on_one_column = true,
	},
	master = {
		new_status = "master",
	},
	dwindle = {
		preserve_split = true, -- You probably want this
	},
	input = {
		kb_layout = "us",
		kb_variant = "",
		kb_model = "",
		kb_options = "",
		kb_rules = "",
		follow_mouse = 1,
		sensitivity = 0,
		touchpad = {
			natural_scroll = false,
		},
	},
	ecosystem = {
		enforce_permissions = true,
	},
	general = {
		gaps_in = 2,
		gaps_out = 0,
		border_size = 0,
		col = {
			active_border = { colors = { "rgb(148, 226, 213)" } },
			inactive_border = "rgb(108, 112, 134)",
		},
		resize_on_border = false,
		allow_tearing = false,
		layout = "dwindle",
	},
	decoration = {
		rounding = 10,
		rounding_power = 0,
		active_opacity = 1.0,
		inactive_opacity = 1.0,
		shadow = {
			enabled = true,
			range = 4,
			render_power = 3,
			color = "rgba(1a1a1aee)",
		},
		blur = {
			enabled = true,
			size = 3,
			passes = 1,
			vibrancy = 0.1696,
		},
	},
	animations = {
		enabled = true,
	},
})

return hyprland
