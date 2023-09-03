local nmap = require("keymaps.mapping").nmap

return {
	{
		"ibhagwan/fzf-lua",
		config = function()
			local fzf_lua = require("fzf-lua")
			nmap("<leader>ff", fzf_lua.builtin, "builtin")
			nmap("<leader>h", fzf_lua.files, "files")
			nmap("<leader>t", fzf_lua.buffers, "buffers")
			nmap("<leader>/", fzf_lua.grep_curbuf, "grep buffer")
			nmap("<leader>sf", fzf_lua.files, "[s]earch [f]iles")
			nmap("<leader>sh", fzf_lua.help_tags, "[s]earch [h]elp")
			nmap("<leader>sw", fzf_lua.grep_cword, "[s]earch current [w]ord")
			nmap("<leader>ss", fzf_lua.resume, "[s]earch last [s]earch")
			nmap("<leader>sl", fzf_lua.live_grep, "[s]earch [l]ive grep")
			nmap("<leader>sg", fzf_lua.grep, "[s]earch [g]rep")
			nmap("<leader>sp", fzf_lua.git_files, "[s]earch [p]roject files")
			nmap("<leader>sd", fzf_lua.diagnostics_workspace, "[s]earch [d]iagnostics")
			nmap("<leader>sgs", fzf_lua.git_status, "[s]earch [n]ew files")
			nmap("<leader>sgc", fzf_lua.git_commits, "[s]earch [a]ll commits")
			nmap("<leader>sgb", fzf_lua.git_bcommits, "[s]earch [b]uffer commits")
			nmap("<leader>sr", fzf_lua.oldfiles, "[s]earch [r]ecent files")

			-- vim.ui.select
			fzf_lua.register_ui_select()
		end,
	},
}
