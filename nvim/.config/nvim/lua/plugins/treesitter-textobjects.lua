return {
	"nvim-treesitter/nvim-treesitter-textobjects",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		require("nvim-treesitter.configs").setup({
			textobjects = {
				swap = {
					enable = true,
					swap_next = {
						["g>"] = "@parameter.inner",
					},
					swap_previous = {
						["g<"] = "@parameter.inner",
					},
				},
			},
		})
	end,
}
