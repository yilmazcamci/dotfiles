return function(keys, func, desc)
	vim.keymap.set("n", keys, func, { desc = desc, noremap = true, silent = true })
end
