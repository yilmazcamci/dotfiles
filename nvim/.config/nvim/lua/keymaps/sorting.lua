local mapping = require("keymaps.mapping")
local nmap = mapping.nmap;
local vmap = mapping.vmap;

vmap("<leader>co", ":sort<cr>", "sort the selected lines")
nmap("<leader>cb", "mzvi{:'<,'>sort<cr>`z", "sort lines in {}")
