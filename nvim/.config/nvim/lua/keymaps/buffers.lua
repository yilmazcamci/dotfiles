local nmap = require("keymaps.mapping").nmap

-- Easier to reach alternate buffer switch.
nmap("<leader>2", ":e #<CR>", "edit alternate file")

-- Quicker hopping between windows.
nmap("<c-l>", "<c-w>l", "[l] right window")
nmap("<c-h>", "<c-w>h", "[h] left window")
nmap("<c-j>", "<c-w>j", "[j] down window")
nmap("<c-k>", "<c-w>k", "[k] up window")

-- Close the current buffer.
-- nmap("<c-x>", ":bdelete<cr>", "[x] close buffer")

-- Close the current buffer.
-- This one closes the current buffer but reuses the window if it can,
-- preserving the splits.
nmap("<c-x>", ":lua MiniBufremove.delete(0)<cr>", "close buffer")
