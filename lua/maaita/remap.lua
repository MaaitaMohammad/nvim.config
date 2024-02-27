vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.wo.number = true
vim.wo.relativenumber = true

vim.api.nvim_create_autocmd("InsertEnter", {
	pattern = "*",
	callback = function()
		vim.schedule(function()
			vim.cmd("noh")
		end)
	end,
})
