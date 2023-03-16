-- Set <space> as the leader key
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- advised by nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

-- vim.api.nvim_set_option("updatetime", 300)
-- vim.g.mapleader = " "

-- Bufstop
vim.g.BufstopAutoSpeedToggle = 1
vim.g.BufstopSorting = 1

-- Ignore case during search.
vim.api.nvim_set_option("ignorecase", true)
-- Unless user used uppercase.
vim.api.nvim_set_option("smartcase", true)

-- Setting undofile makes undo history persist per-file.
vim.api.nvim_set_option("undofile", true)

vim.api.nvim_set_option("tabstop", 4)

-- More sensible tabstop
-- vim.o.tabstop = 4

-- ???
-- vim.api.nvim_set_option("completeopt", "menu,menuone,noselect")

-- cmdheight = 0 is great, except it forces a prompt sometimes.
-- Notably when using fugitive to make a commit.
-- As soon as a workaround is found, set it back to 0.
-- folke/noice manages to alleviate this issue.
vim.api.nvim_set_option("cmdheight", 1)

vim.api.nvim_set_option("scrolloff", 8)
