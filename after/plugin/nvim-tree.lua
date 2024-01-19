local function my_on_attach(bufnr)
	local api = require("nvim-tree.api")

	-- default mappings
	api.config.mappings.default_on_attach(bufnr)

	-- custom mappings
	vim.keymap.set("n", "<leader>pv", api.tree.toggle)
	vim.keymap.set("n", "<leader>hpv", api.tree.toggle_help)
end

require("nvim-tree").setup({
	on_attach = my_on_attach,
	hijack_cursor = true,
	disable_netrw = true,
	view = {
		relativenumber = true,
	},
	actions = {
		open_file = {
			quit_on_open = true,
		},
	},
})
