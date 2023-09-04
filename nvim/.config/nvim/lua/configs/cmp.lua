-- nvim-cmp setup
local cmp = require("cmp")
local luasnip = require("luasnip")

luasnip.config.setup({})

---@diagnostic disable-next-line: missing-fields
cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete({}),
		["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
		["<Tab>"] = cmp.mapping(function(fallback)
			if require("copilot.suggestion").is_visible() then
				require("copilot.suggestion").accept()
			elseif cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				-- HACK: insert tab
				-- Find out why its broken and fix.
				local pos = vim.api.nvim_win_get_cursor(0)
				vim.api.nvim_buf_set_text(0, pos[1] - 1, pos[2], pos[1] - 1, pos[2], { "  " })
				vim.api.nvim_win_set_cursor(0, { pos[1], pos[2] + 2 })
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	}),
	sources = {
		-- Copilot
		{ name = "copilot" },
		-- Path completion
		{ name = "path" },
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "crates" },
		{ name = "emmet_vim" },
	},
})
