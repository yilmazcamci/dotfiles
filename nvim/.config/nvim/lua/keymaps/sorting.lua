vim.keymap.set("v", "<leader>co", ":sort<cr>", { noremap = true, silent = true, desc = "sort the selected lines" })
vim.keymap.set("n", "<leader>cb", "mzvi{:'<,'>sort<cr>`z", { noremap = true, silent = true, desc = "sort lines in {}" })
