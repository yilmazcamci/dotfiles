local default_options = { noremap = true, silent = true }
local current_buffer = 0
vim.api.nvim_buf_set_keymap(current_buffer, "n", "cc", "<cmd>Git commit --quiet<CR>", default_options)
vim.api.nvim_buf_set_keymap(current_buffer, "n", "ca", "<cmd>Git commit --quiet --amend<CR>", default_options)
vim.api.nvim_buf_set_keymap(current_buffer, "n", "ce", "<cmd>Git commit --quiet --amend --no-edit<CR>", default_options)
