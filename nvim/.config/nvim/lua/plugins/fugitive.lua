local nmap = require("keymaps.nmap")

return {
	"tpope/vim-fugitive",
	config = function()
		nmap("<leader>gs", "<cmd>vertical Git <cr>", "[G]it [s]tatus")
		nmap("<leader>gc", "<cmd>Git commit --quiet<cr>", "[G]it [s]tatus")
		nmap("<leader>gfp", "<cmd>Git push<cr>", "[G]it [p]ush")
		nmap("<leader>gfP", "<cmd>Git pull<cr>", "[G]it [P]ull")
	end,
}
