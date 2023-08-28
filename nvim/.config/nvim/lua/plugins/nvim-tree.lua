local function on_attach(bufnr)
	local api = require("nvim-tree.api")

	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	api.config.mappings.default_on_attach(bufnr)

	vim.keymap.set("n", "<cr>", api.node.open.replace_tree_buffer, opts("Open: In Place"))
end

return {
	"nvim-tree/nvim-tree.lua",
	config = function()
		require("nvim-tree").setup({
			on_attach = on_attach,
			actions = {
				change_dir = {
					enable = false,
				},
			},
		})
	end,
	-- dependencies = { "nvim-tree/nvim-web-devicons" },
}
