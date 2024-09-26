local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>pf", function()
	local node = require("nvim-tree.api").tree.get_node_under_cursor()
	if node then
		return builtin.find_files({
			search_dirs = { node.absolute_path },
		})
	else
		return builtin.find_files()
	end
end, {})

vim.keymap.set("n", "<C-p>", builtin.git_files, {})

vim.keymap.set("n", "<leader>ps", function()
	local node = require("nvim-tree.api").tree.get_node_under_cursor()
	if node then
		return builtin.live_grep({
			search_dirs = { node.absolute_path },
		})
	else
		return builtin.live_grep()
	end
end, {})
