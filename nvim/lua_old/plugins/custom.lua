return {
	{
		"navarasu/onedark.nvim",
		lazy = true,
		opts = {
			style = "warmer",
		},
	},

	{ "ellisonleao/gruvbox.nvim", priority = 1000, config = true },
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "gruvbox",
		},
	},
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
				"rust",
				"c",
			},
		},
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		enabled = false,
	},
	{ "tpope/vim-fugitive" },
	{
		"nvim-neo-tree/neo-tree.nvim",
		follow_current_file = {
			enabled = false,
			leave_dirs_open = false,
		},
	},
	{
		"alexghergh/nvim-tmux-navigation",
		config = function()
			require("nvim-tmux-navigation").setup({
				disable_when_zoomed = true, -- defaults to false
				keybindings = {
					left = "<C-h>",
					down = "<C-j>",
					up = "<C-k>",
					right = "<C-l>",
					last_active = "<C-\\>",
					next = "<C-Space>",
				},
			})
		end,
	},
}
