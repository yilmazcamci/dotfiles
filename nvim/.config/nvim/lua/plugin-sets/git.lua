return {
	-- Git related plugins
	{
		"tpope/vim-fugitive",
		keys = {
			{ "<leader>gs",  "<cmd>Git <cr>",               desc = "[G]it [s]tatus" },
			{ "<leader>gc",  "<cmd>Git commit --quiet<cr>", desc = "[G]it [s]tatus" },
			{ "<leader>gfp", "<cmd>Git push<cr>",           desc = "[G]it [p]ush" },
			{ "<leader>gfP", "<cmd>Git pull<cr>",           desc = "[G]it [P]ull" },
		},
	},

	-- Makes the buffer git aware, showing a diff in the gutter and offering many actions to stage, preview, blame, etc.
	require("plugins.gitsigns"),

	-- Better view for file and entire worktree diffs.
	require("plugins.diffview"),

	-- Visual conflict markers in git merge conflicts
	-- "rhysd/conflict-marker.vim",
}
