return {
	"Bryley/neoai.nvim",
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
	cmd = {
		"NeoAI",
		"NeoAIOpen",
		"NeoAIClose",
		"NeoAIToggle",
		"NeoAIContext",
		"NeoAIContextOpen",
		"NeoAIContextClose",
		"NeoAIInject",
		"NeoAIInjectCode",
		"NeoAIInjectContext",
		"NeoAIInjectContextCode",
	},
	keys = {
		{ "<leader>as", desc = "summarize text" },
		{ "<leader>ag", desc = "generate git message" },
	},
	config = function()
		require("neoai").setup({
			ui = {
				submit = "<C-m>",
				quit = "<C-c>",
				quit_context = "<C-c>",
				width = 30,
			},
			models = {
				{
					name = "openai",
					model = "gpt-4",
					-- model = "gpt-3.5-turbo",
					params = nil,
				},
			},
		})
	end,
}
