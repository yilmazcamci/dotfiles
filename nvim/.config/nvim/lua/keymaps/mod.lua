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
