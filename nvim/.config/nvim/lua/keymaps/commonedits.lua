local nmap = require("keymaps.mapping").nmap

-- Append common line ending.
nmap("<leader>a,", "mzA,<esc>`z", "[a]ppend [,]")
nmap("<leader>a.", "mzA.<esc>`z", "[a]ppend [,]")
nmap("<leader>a;", "mzA;<esc>`z", "[a]ppend [,]")

-- Remove the current line ending
nmap("<leader>ax", "mz$x<esc>`z", "[a]ppend [x]")
