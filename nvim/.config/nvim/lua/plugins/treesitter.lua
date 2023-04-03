-- Treesitter
-- Source parser, enables highlighting, AST based editing, and navigation.
return {
	-- Highlight, edit, and navigate code
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	version = nil,
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
		-- On start, Treesitter logs whether all parsers are up to date.
		-- When using cmdheight = 0, this means starting nvim halts with an annoying "Press enter to continue".
		-- This still happens when a notification plugin is available as treesitter somehow loads quite early.
		-- We add our notifier plugin as a dependency to ensure it loads first.
		"vigoux/notifier.nvim",
	},
	config = function()
		pcall(require("nvim-treesitter.install").update({ with_sync = true }))
	end,
}
