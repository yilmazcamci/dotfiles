local nmap = require("keymaps.nmap")

-- Append common line ending.
nmap("<space>a,", "mzA,<esc>`z", "[a]ppend [,]")
nmap("<space>a.", "mzA.<esc>`z", "[a]ppend [,]")
nmap("<space>a;", "mzA;<esc>`z", "[a]ppend [,]")
