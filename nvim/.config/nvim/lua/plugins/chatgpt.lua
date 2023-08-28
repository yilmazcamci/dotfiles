local nmap = require("keymaps.nmap")
return {
	"jackMort/ChatGPT.nvim",
	event = "VeryLazy",
	config = function()
		require("chatgpt").setup({
			popup_layout = {
				default = "center",
				right = {
					width = "40%",
					width_settings_open = "60%",
				},
			},
			openai_params = {
				-- model = "gpt-3.5-turbo",
				model = "gpt-4",
				frequency_penalty = 0,
				presence_penalty = 0,
				max_tokens = 300,
				temperature = 0,
				top_p = 1,
				n = 1,
			},
		})
		nmap("<leader>ac", ":ChatGPT<CR>", "chatgpt")
	end,
	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
}
