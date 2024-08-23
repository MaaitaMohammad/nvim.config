-- Utilities for creating configurations
local util = require("formatter.util")

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup({
	-- Enable or disable logging
	logging = true,
	-- Set the log level
	log_level = vim.log.levels.WARN,
	-- All formatter configurations are opt-in
	filetype = {
		-- Formatter configurations for filetype "lua" go here
		-- and will be executed in order
		lua = {
			-- "formatter.filetypes.lua" defines default configurations for the
			-- "lua" filetype
			require("formatter.filetypes.lua").stylua,
		},
		javascript = {
			require("formatter.filetypes.javascript").prettier,
		},
		mjs = {
			require("formatter.filetypes.javascript").prettier,
		},
		javascriptreact = {
			require("formatter.filetypes.typescriptreact").prettier,
		},
		html = {
			require("formatter.filetypes.html").prettier,
		},
		json = {
			require("formatter.filetypes.json").prettier,
		},
		typescript = {
			require("formatter.filetypes.typescript").prettier,
		},
		typescriptreact = {
			require("formatter.filetypes.typescriptreact").prettier,
		},
		python = {
			require("formatter.filetypes.python").black,
		},
		rust = {
			require("formatter.filetypes.rust").rustfmt,
		},
		dart = {
			require("formatter.filetypes.dart").dartformat,
		},
		markdown = {
			require("formatter.filetypes.markdown").prettier,
		},
		cpp = {
			require("formatter.filetypes.cpp").clangformat,
		},
		c = {
			require("formatter.filetypes.c").clangformat,
		},
		prisma = {
			function()
				return {
					exe = "prisma format",
					args = {

						"--schema",
					},
					stdin = false,
					try_node_modules = true,
				}
			end,
		},
		esdl = {},
		go = {
			require("formatter.filetypes.go").gofmt,
		},
		java = {
			require("formatter.filetypes.java").clangformat,
		},
		css = {
			require("formatter.filetypes.css").prettier,
		},
		-- Use the special "*" filetype for defining formatter configurations on
		-- any filetype
		["*"] = {
			-- "formatter.filetypes.any" defines default configurations for any
			-- filetype
			require("formatter.filetypes.any").remove_trailing_whitespace,
			function()
				if util.get_current_buffer_file_name():find("^tsconfig") ~= nil then
					return require("formatter.filetypes.json").prettier()
				end
			end,
		},
	},
})

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
augroup("__formatter__", { clear = true })
autocmd("BufWritePost", {
	group = "__formatter__",
	command = ":FormatWrite",
})
