local nmap = require("keymaps.mapping").nmap

-- Append common line ending.
nmap("<leader>a,", "mzA,<esc>`z", "[a]ppend [,]")
nmap("<leader>a.", "mzA.<esc>`z", "[a]ppend [,]")
nmap("<leader>a;", "mzA;<esc>`z", "[a]ppend [,]")
