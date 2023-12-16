return {
	{
		"navarasu/onedark.nvim",
		lazy = true,
		opts = {
			style = "warmer",
		},
	},
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "onedark",
		},
	},
	{ "folke/trouble.nvim", enabled = false },
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"bash",
				"html",
				"javascript",
				"json",
				"lua",
				"markdown",
				"markdown_inline",
				"python",
				"query",
				"regex",
				"tsx",
				"typescript",
				"vim",
				"yaml",
				"ruby",
			},
		},
	},
}
