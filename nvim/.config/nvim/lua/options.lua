-- Set <space> as the leader key.
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used).
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Suggestions from nvim-tree.
-- Disable netrw.
-- Set termguicolors.
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.o.termguicolors = true

-- vim.api.nvim_set_option("updatetime", 300)
-- vim.g.mapleader = " "

-- Bufstop.
vim.g.BufstopAutoSpeedToggle = 1
vim.g.BufstopSorting = 1

-- Indent defaults.
vim.g.tabstop = 2
vim.g.shiftwidth = 2

-- Ignore case during search.
vim.api.nvim_set_option("ignorecase", true)
-- Unless user used uppercase.
vim.api.nvim_set_option("smartcase", true)

-- Setting undofile makes undo history persist per-file.
vim.api.nvim_set_option("undofile", true)

-- More sensible default tabstop.
vim.api.nvim_set_option("tabstop", 4)

-- ???
-- vim.api.nvim_set_option("completeopt", "menu,menuone,noselect")

-- cmdheight = 0 is great, except it forces a prompt sometimes.
-- Notably when using fugitive to make a commit.
-- As soon as a workaround is found, set it back to 0.
-- folke/noice manages to alleviate this issue.
vim.api.nvim_set_option("cmdheight", 0)

vim.api.nvim_set_option("scrolloff", 8)

vim.api.nvim_set_option("cursorline", false)
vim.api.nvim_set_option("number", false)
vim.api.nvim_set_option("wrap", true)

-- Set highlight on search
vim.o.hlsearch = true

-- Make line numbers default
-- vim.wo.number = true

-- Enable mouse mode
-- vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
-- vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = "yes"

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"
