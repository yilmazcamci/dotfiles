-- advised by nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

vim.cmd.colorscheme("catppuccin-macchiato")

vim.api.nvim_set_option("updatetime", 300)

vim.g.mapleader = " "

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

-- ???
vim.api.nvim_set_option("completeopt", "menu,menuone,noselect")

vim.api.nvim_set_option("cmdheight", 0)

vim.api.nvim_set_option("scrolloff", 8)
