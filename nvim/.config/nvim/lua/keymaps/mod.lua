local default_options = { noremap = true, silent = true }

-- Paste without overwriting register.
vim.keymap.set("x", "<leader>p", '"_dP', default_options)

-- Clear search highlight.
vim.keymap.set("n", "<space>sc", ":noh<cr>", default_options)

-- Quick save
vim.keymap.set("n", "<c-s>", ":w<cr>", default_options)
vim.keymap.set("i", "<c-s>", "<esc>:w<cr>", default_options)

-- Disable suspend
-- vim.keymap.set("n", "<c-z>", "<nop>", default_options)

require("keymaps.buffers")
require("keymaps.commonedits")
require("keymaps.sorting")

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- [[ Highlight on yank ]]
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set("n", "<c-[>", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "<c-]>", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- Config the config.
vim.keymap.set("n", "<space>ve", ":e ~/.config/nvim/init.lua<cr>", { noremap = true, silent = true })

-- Reload the config.
vim.keymap.set("n", "<space>vr", ":source ~/.config/nvim/init.lua<cr>", { noremap = true, silent = true })

-- nvim-tree
-- This somehow does not work in the lazy config fn
-- local function toggle_replace()
-- 	local view = require("nvim-tree.view")
-- 	local api = require("nvim-tree.api")
-- 	if view.is_visible() then
-- 		api.tree.close()
-- 	else
-- 		require("nvim-tree").open_replacing_current_buffer()
-- 	end
-- end

-- vim.keymap.set("n", "-", toggle_replace)
