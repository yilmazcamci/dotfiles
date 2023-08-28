-- Treesitter
-- Source parser, enables highlighting, AST based editing, and navigation.
return {
	-- Highlight, edit, and navigate code
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		-- On start, Treesitter logs whether all parsers are up to date.
		-- When using cmdheight = 0, this means starting nvim halts with an annoying "Press enter to continue".
		-- This still happens when a notification plugin is available as treesitter somehow loads quite early.
		-- We add our notifier plugin as a dependency to ensure it loads first.
		"vigoux/notifier.nvim",
	},
	config = function()
		require("nvim-treesitter.configs").setup({
			auto_install = true,
			disable = function(_, buf)
				local max_filesize = 100 * 1024 -- 100 KB
				local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
				if ok and stats and stats.size > max_filesize then
					return true
				end
			end,
			highlight = {
				enable = true,
			},
		})
	end,
	-- config = function()
	-- 	pcall(require("nvim-treesitter.install").update({ with_sync = true }))
	-- end,
}
