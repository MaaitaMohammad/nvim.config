-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		-- or                            , branch = '0.1.x',
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	use({
		"princejoogie/dir-telescope.nvim",
		-- telescope.nvim is a required dependency
		requires = { "nvim-telescope/telescope.nvim" },
		config = function()
			require("dir-telescope").setup({
				-- these are the default options set
				hidden = true,
				no_ignore = false,
				show_preview = true,
			})
		end,
	})

	use({ "EdenEast/nightfox.nvim" })

	use({ "savq/melange-nvim" })

	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})

	use({
		"nvim-treesitter/playground",
	})

	use({
		"ThePrimeagen/harpoon",
	})

	use({
		"mbbill/undotree",
	})

	use({
		"tpope/vim-fugitive",
	})

	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },
			-- Snippets
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
			{ "ranjithshegde/ccls.nvim" },
		},
	})

	use({ "mhartington/formatter.nvim" })

	use({
		"akinsho/flutter-tools.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
			"stevearc/dressing.nvim",
		},
	})

	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons",
		},
	})

	use({
		"ThePrimeagen/vim-be-good",
	})

	use("lewis6991/gitsigns.nvim")

	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })

	use({ "windwp/nvim-autopairs" })

	use("alec-gibson/nvim-tetris")

	use("numToStr/Comment.nvim")

	use("JoosepAlviste/nvim-ts-context-commentstring")

	use("mcookly/bidi.nvim")

	use("edgedb/edgedb-vim")

	use({
		"VonHeikemen/fine-cmdline.nvim",
		requires = {
			"MunifTanjim/nui.nvim",
		},
	})

	use({
		"gelguy/wilder.nvim",
	})

	use({
		"kristijanhusak/vim-dadbod-ui",
		requires = {
			{ "tpope/vim-dadbod", lazy = true },
			{ "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
		},
	})

	use({
		"David-Kunz/gen.nvim",
	})
end)
