local set_option = vim.api.nvim_set_option

vim.cmd("colorscheme base16-tomorrow-night")

vim.api.nvim_set_option("updatetime", 300)

vim.g.mapleader = " "

-- Bufstop
vim.g.BufstopAutoSpeedToggle = 1
vim.g.BufstopSorting = 1

-- Ignore case during search.
set_option("ignorecase", true)
-- Unless user used uppercase.
set_option("smartcase", true)

-- Setting undofile makes undo history persist per-file.
set_option("undofile", true)

set_option("tabstop", 4)

-- ???
set_option("completeopt", "menu,menuone,noselect")
