local default_options = { noremap = true, silent = true }
local keyset = vim.keymap.set

-- Config the config.
keyset("n", "<space>ve", ":e ~/.config/nvim/init.lua<cr>", default_options)

-- Reload the config.
keyset("n", "<space>vr", ":source ~/.config/nvim/init.lua<cr>", default_options)

-- Quicker exit insert, jk is nice too but not when you write Dutch.
-- Use <c-c>/<c-s>!
-- keyset("i", "jj", "<esc>", opts)

-- Quick save
keyset("n", "<c-s>", ":w<cr>", default_options)
keyset("i", "<c-s>", "<esc>:w<cr>", default_options)

-- fzf-lua
-- keyset('n', '<space>ff', ':FzfLua <CR>', opts)
-- keyset("n", "<space>h", ":FzfLua files<CR>", opts)
-- keyset("n", "<space>h", ":FzfLua files<cr>", opts)
-- keyset("n", "<space>t", ":FzfLua buffers<CR>", opts)
-- keyset("n", "<space>n", ":FzfLua git_files<CR>", opts)
-- keyset("n", "<space>u", ":FzfLua git_status<CR>", opts)
-- keyset("n", "<space>gb", ":FzfLua git_bcommits<CR>", opts)
-- keyset("n", "<space>sr", ":FzfLua live_grep_glob<CR>", opts)
-- keyset("n", "<space>sw", ":FzfLua grep_cword<CR>", opts)
-- Search Maps

-- vim.command(Maps :FzfLua keymaps

-- Clear search highlight.
keyset("n", "<space>sc", ":noh<cr>", default_options)
vim.keymap.set("n", "<leader>sa", ":Telescope live_grep<cr>", default_options)
vim.keymap.set("n", "<leader>sw", ":Telescope grep_string<cr>", default_options)

-- Fast close buffer.
keyset("n", "<space>bd", ":bdelete<cr>", default_options)
keyset("n", "<space>bD", ":%bd|e#|bd#<cr>|'\"", default_options)

-- Buffer navigation.
keyset("n", "<c-l>", "<c-w>l", default_options)
keyset("n", "<c-h>", "<c-w>h", default_options)
-- keyset("n", "<c-j>", "<c-w>j", default_options)
-- keyset("n", "<c-k>", "<c-w>k", default_options)
keyset("n", "<c-x>", ":bdelete<cr>", default_options)

-- Append common line ending.
keyset("n", "<space>a,", "mzA,<esc>`z", default_options)
keyset("n", "<space>a.", "mzA.<esc>`z", default_options)
keyset("n", "<space>a;", "mzA;<esc>`z", default_options)

keyset("v", "<leader>co", ":sort<cr>", default_options)
keyset("n", "<leader>cb", "mzvi{:'<,'>sort<cr>`z", default_options)

-- Paste without overwriting register.
keyset("x", "<space>p", '"_dP', default_options)

keyset("n", "<leader>ps", ":PackerSync<cr>", default_options)
