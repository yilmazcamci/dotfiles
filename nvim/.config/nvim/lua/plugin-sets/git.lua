return {
	-- Git related plugins
	require("plugins.fugitive"),

	-- Makes the buffer git aware, showing a diff in the gutter and offering many actions to stage, preview, blame, etc.
	require("plugins.gitsigns"),

	-- Better view for file and entire worktree diffs.
	require("plugins.diffview"),

	-- Visual conflict markers in git merge conflicts
	-- "rhysd/conflict-marker.vim",
}
