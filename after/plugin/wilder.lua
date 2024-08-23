local wilder = require("wilder")

wilder.setup({
	modes = { ":", "/", "?" },
	next_key = "<C-n>",
	previous_key = "<C-p>",
})

wilder.set_option("pipeline", {
	wilder.branch(wilder.cmdline_pipeline({
		-- sets the language to use, 'vim' and 'python' are supported
		language = "vim",
		-- 0 turns off fuzzy matching
		-- 1 turns on fuzzy matching
		-- 2 partial fuzzy matching (match does not have to begin with the same first letter)
		fuzzy = 1,
	})),
})

wilder.set_option(
	"renderer",
	wilder.popupmenu_renderer(wilder.popupmenu_border_theme({
		highlighter = wilder.basic_highlighter(),
		min_width = "100%", -- minimum height of the popupmenu, can also be a number
		min_height = "50%", -- to set a fixed height, set max_height to the same value
		reverse = 0, -- if 1, shows the candidates from bottom to top
	}))
)
