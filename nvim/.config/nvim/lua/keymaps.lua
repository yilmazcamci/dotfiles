local default_options = { noremap = true, silent = true }

-- Config the config.
vim.keymap.set("n", "<space>ve", ":e ~/.config/nvim/init.lua<cr>", default_options)

-- Reload the config.
vim.keymap.set("n", "<space>vr", ":source ~/.config/nvim/init.lua<cr>", default_options)

-- Quicker exit insert, jk is nice too but not when you write Dutch.
-- Use <c-c>/<c-s>!
-- vim.keymap.set("i", "jj", "<esc>", opts)

-- Quick save
vim.keymap.set("n", "<c-s>", ":w<cr>", default_options)
vim.keymap.set("i", "<c-s>", "<esc>:w<cr>", default_options)

-- Clear search highlight.
vim.keymap.set("n", "<space>sc", ":noh<cr>", default_options)
vim.keymap.set("n", "<leader>sa", ":Telescope live_grep<cr>", default_options)
vim.keymap.set("n", "<leader>sw", ":Telescope grep_string<cr>", default_options)

-- Fast close buffer.
vim.keymap.set("n", "<space>bd", ":bdelete<cr>", default_options)
vim.keymap.set("n", "<space>bD", ":%bd|e#|bd#<cr>|'\"", default_options)

-- Buffer navigation.
vim.keymap.set("n", "<c-l>", "<c-w>l", default_options)
vim.keymap.set("n", "<c-h>", "<c-w>h", default_options)
-- vim.keymap.set("n", "<c-j>", "<c-w>j", default_options)
-- vim.keymap.set("n", "<c-k>", "<c-w>k", default_options)
vim.keymap.set("n", "<c-x>", ":bdelete<cr>", default_options)

-- Append common line ending.
vim.keymap.set("n", "<space>a,", "mzA,<esc>`z", default_options)
vim.keymap.set("n", "<space>a.", "mzA.<esc>`z", default_options)
vim.keymap.set("n", "<space>a;", "mzA;<esc>`z", default_options)

vim.keymap.set("v", "<leader>co", ":sort<cr>", default_options)
vim.keymap.set("n", "<leader>cb", "mzvi{:'<,'>sort<cr>`z", default_options)

-- Paste without overwriting register.
vim.keymap.set("x", "<space>p", '"_dP', default_options)

vim.keymap.set("n", "<leader>ps", ":PackerSync<cr>", default_options)

vim.keymap.set("n", "<leader>cta", "dw%lx%csBb")
