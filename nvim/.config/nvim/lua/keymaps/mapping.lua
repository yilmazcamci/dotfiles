local keymap = function(mode, keys, func, opts)
	opts = opts or {}
	opts.noremap = opts.noremap or true
	opts.silent = opts.silent or true
	vim.keymap.set(mode, keys, func, opts)
end

local nmap = function(keys, func, desc)
	keymap("n", keys, func, {desc = desc})
end

local imap = function(keys, func, desc)
	keymap("i", keys, func, {desc = desc})
end

local xmap = function(keys, func, desc)
	keymap("x", keys, func, {desc = desc})
end

local vmap = function(keys, func, desc)
	keymap("v", keys, func, {desc = desc})
end

return {
	imap = imap,
	nmap = nmap,
	vmap = vmap,
	xmap = xmap,
}
