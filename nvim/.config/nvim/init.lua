require("plugins")
require("options")
require("keymaps")

require("nvim-treesitter.configs").setup({
	auto_install = true,
	highlight = { enable = false },
	matchup = {
		enable = true, -- mandatory, false will disable the whole extension
	},
})

-- require("mason").setup()
-- require("mason-lspconfig").setup({
-- 	ensure_installed = { "sumneko_lua", "tsserver", "tailwindcss", "taplo" },
-- 	automatic_installation = true,
-- })

local function toggle_replace()
	local view = require("nvim-tree.view")
	if view.is_visible() then
		view.close()
	else
		require("nvim-tree").open_replacing_current_buffer()
	end
end

vim.keymap.set("n", "-", toggle_replace)

require("nvim-tree").setup({
	view = {
		mappings = {
			list = {
				{ key = "<cr>", action = "edit_in_place" },
			},
		},
	},
})

require("lualine").setup({
	options = { section_separators = "", component_separators = "" },
})

require("gitsigns").setup({
	on_attach = function(bufnr)
		local gs = package.loaded.gitsigns

		local function map(mode, l, r, opts)
			opts = opts or {}
			opts.buffer = bufnr
			vim.keymap.set(mode, l, r, opts)
		end

		-- Navigation
		map("n", "]c", function()
			if vim.wo.diff then
				return "]c"
			end
			vim.schedule(function()
				gs.next_hunk()
			end)
			return "<Ignore>"
		end, { expr = true })

		map("n", "[c", function()
			if vim.wo.diff then
				return "[c"
			end
			vim.schedule(function()
				gs.prev_hunk()
			end)
			return "<Ignore>"
		end, { expr = true })

		-- Actions
		map({ "n", "v" }, "<leader>gt", ":Gitsigns stage_hunk<CR>")
		map({ "n", "v" }, "<leader>gr", ":Gitsigns reset_hunk<CR>")
		map({"n", "v"}, "<leader>ge", ":Gedit<CR>")
		map("n", "<leader>gS", gs.stage_buffer)
		map("n", "<leader>gu", gs.undo_stage_hunk)
		map("n", "<leader>gR", gs.reset_buffer)
		map("n", "<leader>gp", gs.preview_hunk)
		map("n", "<leader>gb", function()
			gs.blame_line({ full = true })
		end)
		map("n", "<leader>tb", gs.toggle_current_line_blame)
		map("n", "<leader>gd", gs.diffthis)
		map("n", "<leader>gD", function()
			gs.diffthis("~")
		end)
		map("n", "<leader>td", gs.toggle_deleted)

		-- Text object
		map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
	end,
})

-- local has_words_before = function()
-- 	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
-- 	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
-- end

-- local lsp_formatting = function(bufnr)
-- 	vim.lsp.buf.format({
-- 		filter = function(client)
-- 			-- apply whatever logic you want (in this example, we'll only use null-ls)
-- 			return client.name == "null-ls"
-- 		end,
-- 		bufnr = bufnr,
-- 	})
-- end

-- if you want to set up formatting on save, you can use this as a callback
-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
-- local opts = { noremap = true, silent = true }
-- vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
-- vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
-- vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
-- vim.keymap.set("n", "<c-k>", vim.diagnostic.goto_prev, opts)
-- vim.keymap.set("n", "<c-j>", vim.diagnostic.goto_next, opts)
-- vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)
-- vim.keymap.set("n", "<space>oi", "<cmd>TypescriptOrganizeImports<cr>", opts)

-- local lspkind = require("lspkind")
-- local cmp = require("cmp")

-- local luasnip = require("luasnip")

-- cmp.setup({
-- 	snippet = {
-- 		expand = function(args)
-- 			luasnip.lsp_expand(args.body) -- For `luasnip` users.
-- 		end,
-- 	},
-- 	window = {
-- 		-- completion = cmp.config.window.bordered(),
-- 		-- documentation = cmp.config.window.bordered(),
-- 	},
-- 	mapping = cmp.mapping.preset.insert({
-- 		["<Tab>"] = cmp.mapping(function(fallback)
-- 			if cmp.visible() then
-- 				cmp.select_next_item()
-- 			elseif luasnip.expand_or_jumpable() then
-- 				luasnip.expand_or_jump()
-- 			elseif has_words_before() then
-- 				cmp.complete()
-- 			else
-- 				fallback()
-- 			end
-- 		end, { "i", "s" }),

-- 		["<S-Tab>"] = cmp.mapping(function(fallback)
-- 			if cmp.visible() then
-- 				cmp.select_prev_item()
-- 			elseif luasnip.jumpable(-1) then
-- 				luasnip.jump(-1)
-- 			else
-- 				fallback()
-- 			end
-- 		end, { "i", "s" }),
-- 		["<C-b>"] = cmp.mapping.scroll_docs(-4),
-- 		["<C-f>"] = cmp.mapping.scroll_docs(4),
-- 		["<C-Space>"] = cmp.mapping.complete(),
-- 		["<C-e>"] = cmp.mapping.abort(),
-- 		["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
-- 		["<C-y"] = cmp.mapping.confirm({ select = true }),
-- 	}),
-- 	sources = cmp.config.sources({
-- 		{ name = "nvim_lsp" },
-- 		{ name = "nvim_lsp_signature_help" },
-- 		{ name = "nvim_lua" },
-- 		{ name = "luasnip" },
-- 		{ name = "path" },
-- 	}, {
-- 		{ name = "buffer" },
-- 	}),
-- 	formatting = {
-- 		format = lspkind.cmp_format({
-- 			-- mode = 'symbol', -- show only symbol annotations
-- 			-- maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
-- 			with_text = true,
-- 		}),
-- 	},
-- })

-- Set configuration for specific filetype.
-- cmp.setup.filetype("gitcommit", {
-- 	sources = cmp.config.sources({
-- 		{ name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
-- 		{ name = "conventionalcommits" },
-- 	}, {
-- 		{ name = "buffer" },
-- 	}),
-- })

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline("/", {
-- 	mapping = cmp.mapping.preset.cmdline(),
-- 	sources = {
-- 		{ name = "buffer" },
-- 	},
-- })

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline(":", {
-- 	mapping = cmp.mapping.preset.cmdline(),
-- 	sources = cmp.config.sources({
-- 		{ name = "path" },
-- 	}, {
-- 		{ name = "cmdline" },
-- 	}),
-- })

-- Load snippets
-- require("luasnip.loaders.from_vscode").lazy_load()

-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- local lsp_attach = function(client, buf)
-- 	if client.supports_method("textDocument/formatting") then
-- 		vim.api.nvim_clear_autocmds({ group = augroup, buffer = buf })
-- 		vim.api.nvim_create_autocmd("BufWritePre", {
-- 			group = augroup,
-- 			buffer = buf,
-- 			callback = function()
-- 				vim.lsp.buf.format({ async = false, bufnr = buf })
-- 			end,
-- 		})
-- 	end

-- 	-- Example maps, set your own with vim.api.nvim_buf_set_keymap(buf, "n", <lhs>, <rhs>, { desc = <desc> })
-- 	-- or a plugin like which-key.nvim
-- 	-- <lhs>        <rhs>                        <desc>
-- 	-- "K"          vim.lsp.buf.hover            "Hover Info"
-- 	-- "<leader>qf" vim.diagnostic.setqflist     "Quickfix Diagnostics"
-- 	-- "[d"         vim.diagnostic.goto_prev     "Previous Diagnostic"
-- 	-- "]d"         vim.diagnostic.goto_next     "Next Diagnostic"
-- 	-- "<leader>e"  vim.diagnostic.open_float    "Explain Diagnostic"
-- 	-- "<leader>ca" vim.lsp.buf.code_action      "Code Action"
-- 	-- "<leader>cr" vim.lsp.buf.rename           "Rename Symbol"
-- 	-- "<leader>fs" vim.lsp.buf.document_symbol  "Document Symbols"
-- 	-- "<leader>fS" vim.lsp.buf.workspace_symbol "Workspace Symbols"
-- 	-- "<leader>gq" vim.lsp.buf.formatting_sync  "Format File"

-- 	vim.api.nvim_buf_set_option(buf, "formatexpr", "v:lua.vim.lsp.formatexpr()")
-- 	vim.api.nvim_buf_set_option(buf, "omnifunc", "v:lua.vim.lsp.omnifunc")
-- 	vim.api.nvim_buf_set_option(buf, "tagfunc", "v:lua.vim.lsp.tagfunc")

-- 	vim.api.nvim_buf_set_keymap(buf, "n", "<space>K", "vim.lsp.buf.hover", { desc = "Hover Info" })
-- 	vim.api.nvim_buf_set_keymap(buf, "n", "<space>e", "vim.lsp.buf.hover", { desc = "Explain Diagnostic" })

-- 	-- Enable completion triggered by <c-x><c-o>
-- 	vim.api.nvim_buf_set_option(buf, "omnifunc", "v:lua.vim.lsp.omnifunc")

-- 	-- Mappings.
-- 	-- See `:help vim.lsp.*` for documentation on any of the below functions
-- 	local bufopts = { noremap = true, silent = true, buffer = buf }
-- 	-- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
-- 	-- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
-- 	-- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
-- 	-- vim.keymap.set('n', '<space>wl', function()
-- 	--   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
-- 	-- end, bufopts)
-- 	vim.keymap.set("n", "ga", vim.lsp.buf.code_action, bufopts)
-- 	vim.keymap.set("x", "ga", vim.lsp.buf.code_action, bufopts)
-- 	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
-- 	vim.keymap.set("n", "gD", vim.lsp.buf.type_definition, bufopts)
-- 	vim.keymap.set("n", "<space>ld", vim.lsp.buf.definition, bufopts)
-- 	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
-- 	vim.keymap.set("n", "<space>li", vim.lsp.buf.implementation, bufopts)
-- 	vim.keymap.set("n", "<c-t>", vim.lsp.buf.signature_help, bufopts)
-- 	vim.keymap.set("n", "<space>lD", vim.lsp.buf.type_definition, bufopts)
-- 	vim.keymap.set("n", "<space>lr", vim.lsp.buf.rename, bufopts)
-- 	vim.keymap.set("n", "<space>cf", require("lsp_fixcurrent"))
-- 	vim.keymap.set("n", "<space>lf", vim.lsp.buf.format, bufopts)
-- 	vim.keymap.set("n", "gy", vim.lsp.buf.format, bufopts)

-- 	-- vim.keymap.set("v", "ga", vim.api.nvim_eval(":<c-u>lua vim.lsp.buf.range_code_action()<cr>"), bufopts)
-- end

-- Set up lspconfig.
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

-- require("lspconfig").sumneko_lua.setup({ capabilities = capabilities })
-- require("lspconfig").eslint.setup({ capabilities = capabilities })
-- require("lspconfig").rust_analyzer.setup({ capabilities = capabilities })
-- require("lspconfig").tsserver.setup({ on_attach = on_attach })
-- require("lspconfig").emmet_ls.setup({
-- 	-- on_attach = on_attach,
-- 	capabilities = capabilities,
-- 	filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less" },
-- 	init_options = {
-- 		html = {
-- 			options = {
-- 				-- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
-- 				["bem.enabled"] = true,
-- 			},
-- 		},
-- 	},
-- })

-- require("typescript").setup({
-- 	disable_commands = false, -- prevent the plugin from creating Vim commands
-- 	debug = false, -- enable debug logging for commands
-- 	go_to_source_definition = {
-- 		fallback = true, -- fall back to standard LSP definition on failure
-- 	},
-- 	server = { -- pass options to lspconfig's setup method
-- 		on_attach = lsp_attach,
-- 	},
-- })

-- require("rust-tools").setup({
-- 	{
-- 		-- all the opts to send to nvim-lspconfig
-- 		-- these override the defaults set by rust-tools.nvim
-- 		-- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
-- 		server = {
-- 			-- on_attach is a callback called when the language server attachs to the buffer
-- 			on_attach = lsp_attach,
-- 			settings = {
-- 				-- to enable rust-analyzer settings visit:
-- 				-- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
-- 				["rust-analyzer"] = {
-- 					-- enable clippy on save
-- 					checkOnSave = {
-- 						command = "clippy",
-- 					},
-- 				},
-- 			},
-- 		},
-- 	},
-- })

-- rust bindings somehow don't work without this
-- local bufopts = { noremap = true, silent = true }
-- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
-- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
-- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
-- vim.keymap.set('n', '<space>wl', function()
--   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
-- end, bufopts)
-- vim.keymap.set("n", "ga", vim.lsp.buf.code_action, bufopts)
-- vim.keymap.set("x", "ga", vim.lsp.buf.code_action, bufopts)
-- vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
-- vim.keymap.set("n", "gD", vim.lsp.buf.type_definition, bufopts)
-- vim.keymap.set("n", "<space>ld", vim.lsp.buf.definition, bufopts)
-- vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
-- vim.keymap.set("n", "<space>li", vim.lsp.buf.implementation, bufopts)
-- vim.keymap.set("n", "<c-t>", vim.lsp.buf.signature_help, bufopts)
-- vim.keymap.set("n", "<space>lD", vim.lsp.buf.type_definition, bufopts)
-- vim.keymap.set("n", "<space>lr", vim.lsp.buf.rename, bufopts)
-- vim.keymap.set("n", "<space>cf", require("lsp_fixcurrent"))
-- vim.keymap.set("n", "<space>lf", vim.lsp.buf.format, bufopts)
-- vim.keymap.set("n", "gy", vim.lsp.buf.format, bufopts)
-- local null_ls = require("null-ls")
-- null_ls.setup({
-- 	-- you can reuse a shared lspconfig on_attach callback here
-- 	on_attach = lsp_attach,
-- 	log_level = "info",
-- 	sources = {
-- 		-- null_ls.builtins.code_actions.eslint,
-- 		-- null_ls.builtins.diagnostics.eslint,
-- 		-- null_ls.builtins.formatting.eslint,
-- 		null_ls.builtins.formatting.prettier,
-- 		null_ls.builtins.formatting.stylua,
-- 		-- null_ls.builtins.completion.spell,
-- 		null_ls.builtins.formatting.rustywind,
-- 	},
-- })

-- Please code actions
local keymap_opts = { noremap = true, silent = true }

-- Git
vim.keymap.set("n", "<space>gs", "<cmd>Git<cr>", keymap_opts)
vim.keymap.set("n", "<space>gc", "<cmd>Git commit --quiet<cr>", keymap_opts)
local current_buffer = 0
vim.api.nvim_buf_set_keymap(current_buffer, "n", "cc", "<cmd>Git commit --quiet<CR>", keymap_opts)
vim.api.nvim_buf_set_keymap(current_buffer, "n", "ca", "<cmd>Git commit --quiet --amend<CR>", keymap_opts)
vim.api.nvim_buf_set_keymap(current_buffer, "n", "ce", "<cmd>Git commit --quiet --amend --no-edit<CR>", keymap_opts)

-- Show vertical indent lines
require("indent_blankline").setup({
	-- for example, context is off by default, use this to turn it on
	show_current_context = true,
	show_current_context_start = false,
})

require("colorizer").setup()

-- fzf-lua
-- keyset('n', '<space>ff', ':FzfLua <CR>', opts)
-- keyset("n", "<space>h", ":FzfLua files<CR>", opts)
-- keyset("n", "<space>h", ":FzfLua files<cr>", opts)
-- keyset("n", "<space>t", ":FzfLua buffers<CR>", opts)
-- keyset("n", "<space>n", ":FzfLua git_files<CR>", opts)
-- keyset("n", "<space>u", ":FzfLua git_status<CR>", opts)
-- keyset("n", "<space>gb", ":FzfLua git_bcommits<CR>", opts)
-- keyset("n", "<space>sr", ":FzfLua live_grep_glob<CR>", opts)
-- keyset("n", "<space>sw", ":FzfLua grep_cword<CR>", opts)

require("telescope").setup({
	defaults = {
		-- Default configuration for telescope goes here:
		-- config_key = value,
		mappings = {
			i = {
				-- map actions.which_key to <C-h> (default: <C-/>)
				-- actions.which_key shows the mappings for your picker,
				-- e.g. git_{create, delete, ...}_branch for the git_branches picker
				-- ["<C-n>"] = false,
				-- ["<C-p>"] = false,
				["<c-j>"] = "move_selection_next",
				["<c-k>"] = "move_selection_previous",
				["<c-h>"] = "which_key",
			},
		},
	},
	pickers = {
		-- Default configuration for builtin pickers goes here:
		-- picker_name = {
		--   picker_config_key = value,
		--   ...
		-- }
		-- Now the picker_config_key will be applied every time you call this
		-- builtin picker
	},
	extensions = {
		-- Your extension configuration goes here:
		-- extension_name = {
		--   extension_config_key = value,
		-- }
		-- please take a look at the readme of the extension you want to configure
		["ui-select"] = {
			require("telescope.themes").get_dropdown({
				-- even more opts
			}),

			-- 	-- pseudo code / specification for writing custom displays, like the one
			-- 	-- for "codeactions"
			-- 	-- specific_opts = {
			-- 	--   [kind] = {
			-- 	--     make_indexed = function(items) -> indexed_items, width,
			-- 	--     make_displayer = function(widths) -> displayer
			-- 	--     make_display = function(displayer) -> function(e)
			-- 	--     make_ordinal = function(e) -> string
			-- 	--   },
			-- 	--   -- for example to disable the custom builtin "codeactions" display
			-- 	--      do the following
			-- 	--   codeactions = false,
			-- 	-- }
		},
	},
})

require("telescope").load_extension("ui-select")

local telescope_builtin = require("telescope.builtin")

vim.keymap.set("n", "<space>ff", ":Telescope<cr>")
-- vim.keymap.set("n", "<space>th", telescope_builtin.find_files)
vim.keymap.set("n", "<space>h", telescope_builtin.find_files)
vim.keymap.set("n", "<space>n", telescope_builtin.buffers)
vim.keymap.set("n", "<space>fs", telescope_builtin.git_status)
vim.keymap.set("n", "<space>fg", telescope_builtin.git_files)
vim.keymap.set("n", "<space>fm", telescope_builtin.keymaps)

require("nvim-lightbulb").setup({ autocmd = { enabled = true } })

require("notify").setup()
vim.notify = require("notify")

require("auto-session")

require("nvim-treesitter.configs").setup({
	context_commentstring = {
		enable = true,
	},
})

vim.api.nvim_set_option("signcolumn", "yes")

vim.keymap.set("n", "<c-z>", function () end)
