return {
	"echasnovski/mini.nvim",
	---@diagnostic disable-next-line: assign-type-mismatch
	version = false,
	config = function()
		require("mini.basics").setup({
			options = {
				-- Basic options ('termguicolors', 'number', 'ignorecase', and many more)
				basic = true,
				-- Extra UI features ('winblend', 'cmdheight=0', ...)
				extra_ui = false,
				-- Presets for window borders ('single', 'double', ...)
				win_borders = "default",
			},
			-- Mappings. Set to `false` to disable.
			mappings = {
				-- Basic mappings (better 'jk', save with Ctrl+S, ...)
				basic = true,

				-- Window navigation with <C-hjkl>, resize with <C-arrow>
				windows = true,
			},
			-- Autocommands. Set to `false` to disable
			autocommands = {
				-- Basic autocommands (highlight on yank, start Insert in terminal, ...)
				basic = true,

				-- Set 'relativenumber' only in linewise and blockwise Visual mode
				relnum_in_visual_mode = false,
			},
		})
		require("mini.ai").setup()
		require("mini.bracketed").setup()
		require("mini.bufremove").setup()
		-- require("mini.comment").setup()
		require("mini.move").setup({
			mappings = {
				-- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
				left = "<leader>mh",
				right = "<leader>ml",
				down = "<leader>mj",
				up = "<leader>mk",
				-- Move current line in Normal mode
				line_left = "<leader>mh",
				line_right = "<leader>ml",
				line_down = "<leader>mj",
				line_up = "<leader>mk",
			},
		})
	end,
}
