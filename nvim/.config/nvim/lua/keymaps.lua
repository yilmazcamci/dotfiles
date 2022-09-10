local opts = { noremap = true, silent = true }

local keyset = vim.keymap.set

-- Config the config.
keyset("n", "<space>ve", ":e ~/.config/nvim/init.lua<cr>", opts)

-- Reload the config.
keyset("n", "<space>vr", ":source ~/.config/nvim/init.lua<cr>", opts)

-- Quicker exit insert, jk is nice too but not when you write Dutch.
keyset("i", "jj", "<esc>", opts)

-- Quick save
keyset("n", "<c-s>", ":w<cr>", opts)

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
keyset("n", "<space>sc", ":noh<cr>", opts)

-- Fast close buffer.
keyset("n", "<space>bd", ":bdelete<cr>", opts)
keyset("n", "<space>bD", ":%bd|e#|bd#<cr>|'\"", opts)

-- Buffer navigation.
keyset("n", "<c-l>", "<c-w>l", opts)
keyset("n", "<c-h>", "<c-w>h", opts)
keyset("n", "<c-j>", "<c-w>j", opts)
keyset("n", "<c-k>", "<c-w>k", opts)
keyset("n", "<c-x>", ":bdelete<cr>", opts)

-- Append common line ending.
keyset("n", "<space>a,", "mzA,`z", opts)
keyset("n", "<space>a.", "mzA.`z", opts)
keyset("n", "<space>a;", "mzA;`z", opts)

-- Check key mappings.
keyset("n", "<space>sm", ":FzfLua keymaps<cr>", opts)

keyset("v", "<leader>cs", ":sort<cr>", opts)
