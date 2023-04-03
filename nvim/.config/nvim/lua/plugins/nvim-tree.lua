return {
	"nvim-tree/nvim-tree.lua",
	config = function(_, conf)
		require("nvim-tree").setup(conf)
	end,
	opts = {
		view = {
			mappings = {
				list = {
					{ key = "<cr>", action = "edit_in_place" },
				},
			},
		},
		actions = {
			change_dir = {
				enable = false,
			},
		},
	},
}
