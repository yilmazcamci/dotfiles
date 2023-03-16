return {
	-- "rebelot/kanagawa.nvim",
	-- "folke/tokyonight.nvim",
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("catppuccin-macchiato")
		end,
	},
}
