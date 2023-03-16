require("options")

-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- NOTE: Here is where you install your plugins.
--  You can configure plugins using the `config` key.
--
--  You can also configure plugins after the setup call,
--    as they will be available in your neovim runtime.
require("lazy").setup({
	-- Detect tabstop and shiftwidth automatically
	"tpope/vim-sleuth",

	-- NOTE: This is where your plugins related to LSP can be installed.
	--  The configuration is done below. Search for lspconfig to find it below.
	{
		-- LSP Configuration & Plugins
		"neovim/nvim-lspconfig",
		dependencies = {
			-- Automatically install LSPs to stdpath for neovim
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",

			-- Useful status updates for LSP
			{ "j-hui/fidget.nvim", opts = {} },

			-- Additional lua configuration, makes nvim stuff amazing!
			"folke/neodev.nvim",
		},
	},

	{
		-- Autocompletion
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"zbirenbaum/copilot-cmp",
		},
	},

	-- Copilot lsp integration
	require("plugins.copilot"),

	-- Useful plugin to show you pending keybinds.
	{ "folke/which-key.nvim",            opts = {} },

	-- colorschemes
	require("colorschemes"),

	{
		-- Set lualine as statusline
		"nvim-lualine/lualine.nvim",
		opts = {
			options = {
				icons_enabled = false,
				component_separators = "|",
				section_separators = "",
			},
			sections = {
				lualine_x = {},
			},
		},
	},

	{
		-- Add indentation guides even on blank lines
		"lukas-reineke/indent-blankline.nvim",
		-- Enable `lukas-reineke/indent-blankline.nvim`
		-- See `:help indent_blankline.txt`
		opts = {
			char = "┊",
			show_trailing_blankline_indent = false,
		},
	},

	-- "gc" to comment visual regions/lines
	-- { "numToStr/Comment.nvim",         opts = {} },

	require("plugins.telescope"),

	require("plugins.notify"),

	require("plugins.treesitter"),

	-- NOTE: Next Step on Your Neovim Journey: Add/Configure additional "plugins" for kickstart
	--       These are some example plugins that I've included in the kickstart repository.
	--       Uncomment any of the lines below to enable them.
	-- require 'plugins.autoformat',
	-- require 'kickstart.plugins.debug',

	-- NOTE: The import below automatically adds your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
	--    You can use this folder to prevent any conflicts with this init.lua if you're interested in keeping
	--    up-to-date with whatever is in the kickstart repo.
	--
	--    For additional information see: https://github.com/folke/lazy.nvim#-structuring-your-plugins
	--
	--    An additional note is that if you only copied in the `init.lua`, you can just comment this line
	--    to get rid of the warning telling you that there are not plugins in `lua/custom/plugins/`.
	-- { import = 'custom.plugins' },

	require("plugins.files"),

	-- Automatic session management.
	{
		"rmagatti/auto-session",
		opts = {
			log_level = "error",
		},
	},

	-- Shortcuts for common vim actions that come in a pair.
	"tpope/vim-unimpaired",

	-- Add, change, remove surrounding pairs
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		opts = {},
	},

	-- Visual multi cursor editing.
	"mg979/vim-visual-multi",

	-- require("plugins.bufstop"),

	-- Pair, paired characters automatically.
	{ "windwp/nvim-autopairs",           opts = {} },
	{ "windwp/nvim-ts-autotag" },

	-- null-ls extends lsp with additional capabilities.
	{ "jose-elias-alvarez/null-ls.nvim", dependencies = { "nvim-lua/plenary.nvim" } },

	-- {
	-- 	"glepnir/lspsaga.nvim",
	-- 	event = "BufRead",
	-- 	config = function()
	-- 		require("lspsaga").setup({})
	-- 	end,
	-- 	dependencies = {
	-- 		{ "nvim-tree/nvim-web-devicons" },
	-- 		--Please make sure you install markdown and markdown_inline parser
	-- 		{ "nvim-treesitter/nvim-treesitter" },
	-- 	},
	-- },

	-- crates
	{
		"saecki/crates.nvim",
		opts = {},
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},

	-- enhance rust LSP
	{
		"simrat39/rust-tools.nvim",
		opts = {},
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},

	-- minimap bar on right side
	-- { "lewis6991/satellite.nvim",                   opts = {} },

	-- emmet for efficient html-like markup creation
	"mattn/emmet-vim",

	-- support tsx comments
	{ "JoosepAlviste/nvim-ts-context-commentstring" },

	{
		"echasnovski/mini.nvim",
		---@diagnostic disable-next-line: assign-type-mismatch
		version = false,
		config = function()
			require("mini.bufremove").setup()
			require("mini.comment").setup()
		end,
	},

	-- require("plugins.conjure"),
	-- require("plugins.fennel.vim"),

	require("plugin-sets.git"),
}, {})

-- [[ Setting options ]]
-- See `:help vim.o`

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
-- vim.wo.number = true

-- Enable mouse mode
-- vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
-- vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = "yes"

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
-- vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})

-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
require("telescope").setup({
	defaults = {
		mappings = {
			i = {
				["<C-u>"] = false,
				["<C-d>"] = false,
				["<c-j>"] = "move_selection_next",
				["<c-k>"] = "move_selection_previous",
			},
		},
	},
	pickers = {
		buffers = { { sort_lastused = true, ignore_current_buffer = true } },
	},
})

-- Enable telescope fzf native, if installed
pcall(require("telescope").load_extension, "fzf")

-- See `:help telescope.builtin`
vim.keymap.set("n", "<leader>?", require("telescope.builtin").oldfiles, { desc = "[?] Find recently opened files" })
vim.keymap.set("n", "<leader><space>", require("telescope.builtin").buffers, { desc = "[ ] Find existing buffers" })
vim.keymap.set("n", "<leader>/", function()
	-- You can pass additional configuration to telescope to change theme, layout, etc.
	require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		winblend = 10,
		previewer = false,
	}))
end, { desc = "[/] Fuzzily search in current buffer" })

vim.keymap.set("n", "<leader>sf", require("telescope.builtin").find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>sh", require("telescope.builtin").help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>sw", require("telescope.builtin").grep_string, { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>sg", require("telescope.builtin").live_grep, { desc = "[S]earch by [G]rep" })
vim.keymap.set("n", "<leader>sd", require("telescope.builtin").diagnostics, { desc = "[S]earch [D]iagnostics" })

vim.keymap.set("n", "<space>ff", ":Telescope<cr>")
vim.keymap.set("n", "<space>h", require("telescope.builtin").find_files, { desc = "find files" })
vim.keymap.set("n", "<space>t", require("telescope.builtin").buffers, { desc = "find buffers" })
vim.keymap.set("n", "<space>n", require("telescope.builtin").git_status, { desc = "find git status" })
vim.keymap.set("n", "<space>fg", require("telescope.builtin").git_files, { desc = "find git files" })
vim.keymap.set("n", "<space>fm", require("telescope.builtin").keymaps, { desc = "[f]ind key[m]aps" })

require("nvim-treesitter.configs").setup({
	-- Add languages to be installed here that you want installed for treesitter
	ensure_installed = {
		"lua",
		"rust",
		"tsx",
		"typescript",
		"help",
	},
	-- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
	auto_install = true,
	highlight = { enable = true },
	indent = { enable = true, disable = { "python" } },
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<c-space>",
			node_incremental = "<c-space>",
			scope_incremental = "<c-s>",
			node_decremental = "<M-space>",
		},
	},
	textobjects = {
		select = {
			enable = true,
			lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				["aa"] = "@parameter.outer",
				["ia"] = "@parameter.inner",
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
			},
		},
		move = {
			enable = true,
			set_jumps = true, -- whether to set jumps in the jumplist
			goto_next_start = {
				["]m"] = "@function.outer",
				["]]"] = "@class.outer",
			},
			goto_next_end = {
				["]M"] = "@function.outer",
				["]["] = "@class.outer",
			},
			goto_previous_start = {
				["[m"] = "@function.outer",
				["[["] = "@class.outer",
			},
			goto_previous_end = {
				["[M"] = "@function.outer",
				["[]"] = "@class.outer",
			},
		},
		swap = {
			enable = true,
			swap_next = {
				["<leader>a"] = "@parameter.inner",
			},
			swap_previous = {
				["<leader>A"] = "@parameter.inner",
			},
		},
	},
	-- tsx commenting
	context_commentstring = {
		enable = true,
	},
	autotag = {
		enable = true,
	},
})

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set("n", "<c-k>", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "<c-j>", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- LSP settings.
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(client, bufnr)
	local nmap = function(keys, func, desc)
		if desc then
			desc = "LSP: " .. desc
		end

		vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
	end

	nmap("<leader>lr", vim.lsp.buf.rename, "[L]SP [R]ename")
	nmap("<leader>la", vim.lsp.buf.code_action, "[L]SP [C]ode Action")
	nmap("<leader>lf", vim.lsp.buf.format, "[L]SP [f]ormat")

	nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
	nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
	nmap("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
	nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
	nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
	nmap("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

	-- See `:help K` for why this keymap
	nmap("K", vim.lsp.buf.hover, "Hover Documentation")
	-- nmap("<c-K>", vim.lsp.buf.signature_help, "Signature Documentation")
	-- nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

	-- Lesser used LSP functionality
	nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
	nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
	nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
	nmap("<leader>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, "[W]orkspace [L]ist Folders")

	-- Create a command `:Format` local to the LSP buffer
	vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
		vim.lsp.buf.format()
	end, { desc = "Format current buffer with LSP" })

	-- require("lsp-format").on_attach(client)

	-- format on write
	-- vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]

	-- fix problem under the cursor when possible
	nmap("gq", require("lsp_fixcurrent"), "[G]o [Q]uickfix")

	-- null-ls format on save
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.format({
					bufnr = bufnr,
					filter = function(client)
						return client.name ~= "tsserver"
					end,
				})
			end,
		})
	end
end

local null_ls = require("null-ls")
null_ls.setup({
	sources = {
		-- null_ls.builtins.formatting.rustfmt,
		null_ls.builtins.formatting.prettierd,
		null_ls.builtins.formatting.rustywind,
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.gofmt,
		null_ls.builtins.formatting.fnlfmt,
	},
	on_attach = on_attach,
})

-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
local servers = {
	-- clangd = {},
	-- gopls = {},
	-- pyright = {},
	rust_analyzer = {},
	tsserver = {},
	lua_ls = {
		Lua = {
			workspace = { checkThirdParty = false },
			telemetry = { enable = false },
		},
	},
}

-- Setup neovim lua configuration
require("neodev").setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- Setup mason so it can manage external tooling
require("mason").setup()

-- Ensure the servers above are installed
local mason_lspconfig = require("mason-lspconfig")

mason_lspconfig.setup({
	ensure_installed = vim.tbl_keys(servers),
})

mason_lspconfig.setup_handlers({
	function(server_name)
		require("lspconfig")[server_name].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = servers[server_name],
		})
	end,
})

-- setup rust-tools
local rt = require("rust-tools")
rt.setup({
	server = {
		on_attach = on_attach,
	},
})

-- nvim-cmp setup
local cmp = require("cmp")
local luasnip = require("luasnip")

luasnip.config.setup({})

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
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

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et

local default_options = { noremap = true, silent = true }
--
-- -- Config the config.
vim.keymap.set("n", "<space>ve", ":e ~/.config/nvim/init.lua<cr>", default_options)
--
-- -- Reload the config.
-- vim.keymap.set("n", "<space>vr", ":source ~/.config/nvim/init.lua<cr>", default_options)
--
-- -- Quicker exit insert, jk is nice too but not when you write Dutch.
-- -- Use <c-c>/<c-s>!
-- -- vim.keymap.set("i", "jj", "<esc>", opts)
--
-- -- Quick save
vim.keymap.set("n", "<c-s>", ":w<cr>", default_options)
vim.keymap.set("i", "<c-s>", "<esc>:w<cr>", default_options)
--
-- -- fzf-lua
-- -- vim.keymap.set('n', '<space>ff', ':FzfLua <CR>', opts)
-- -- vim.keymap.set("n", "<space>h", ":FzfLua files<CR>", opts)
-- -- vim.keymap.set("n", "<space>h", ":FzfLua files<cr>", opts)
-- -- vim.keymap.set("n", "<space>t", ":FzfLua buffers<CR>", opts)
-- -- vim.keymap.set("n", "<space>n", ":FzfLua git_files<CR>", opts)
-- -- vim.keymap.set("n", "<space>u", ":FzfLua git_status<CR>", opts)
-- -- vim.keymap.set("n", "<space>gb", ":FzfLua git_bcommits<CR>", opts)
-- -- vim.keymap.set("n", "<space>sr", ":FzfLua live_grep_glob<CR>", opts)
-- -- vim.keymap.set("n", "<space>sw", ":FzfLua grep_cword<CR>", opts)
-- -- Search Maps
--
-- -- vim.command(Maps :FzfLua keymaps
--
-- -- Clear search highlight.
vim.keymap.set("n", "<space>sc", ":noh<cr>", default_options)
-- vim.keymap.set("n", "<leader>sa", ":Telescope live_grep<cr>", default_options)
-- vim.keymap.set("n", "<leader>sw", ":Telescope grep_string<cr>", default_options)
--
-- -- Fast close buffer.
-- vim.keymap.set("n", "<space>bd", ":bdelete<cr>", default_options)
-- vim.keymap.set("n", "<space>bD", ":%bd|e#|bd#<cr>|'\"", default_options)
--
-- -- Buffer navigation.
-- vim.keymap.set("n", "<c-l>", "<c-w>l", default_options)
-- vim.keymap.set("n", "<c-h>", "<c-w>h", default_options)
-- -- vim.keymap.set("n", "<c-j>", "<c-w>j", default_options)
-- -- vim.keymap.set("n", "<c-k>", "<c-w>k", default_options)
-- vim.keymap.set("n", "<c-x>", ":bdelete<cr>", default_options)
vim.keymap.set("n", "<leader>2", ":e #<CR>", default_options)
--
-- -- Append common line ending.
-- vim.keymap.set("n", "<space>a,", "mzA,<esc>`z", default_options)
-- vim.keymap.set("n", "<space>a.", "mzA.<esc>`z", default_options)
-- vim.keymap.set("n", "<space>a;", "mzA;<esc>`z", default_options)
--
vim.keymap.set("v", "<leader>co", ":sort<cr>", default_options)
vim.keymap.set("n", "<leader>cb", "mzvi{:'<,'>sort<cr>`z", default_options)
--
-- -- Paste without overwriting register.
-- vim.keymap.set("x", "<space>p", '"_dP', default_options)
--
-- vim.keymap.set("n", "<leader>ps", ":PackerSync<cr>", default_options)
--
-- vim.keymap.set("n", "<leader>cta", "dw%lx%csBb")
--
-- local telescope_builtin = require("telescope.builtin")
--
vim.keymap.set("n", "<space>ff", ":Telescope<cr>")
-- -- vim.keymap.set("n", "<space>th", telescope_builtin.find_files)
-- vim.keymap.set("n", "<space>h", telescope_builtin.find_files)
-- vim.keymap.set("n", "<space>n", telescope_builtin.buffers)
-- vim.keymap.set("n", "<space>fs", telescope_builtin.git_status)
-- vim.keymap.set("n", "<space>fg", telescope_builtin.git_files)
-- vim.keymap.set("n", "<space>fm", telescope_builtin.keymaps)
--
local function toggle_replace()
	local view = require("nvim-tree.view")
	if view.is_visible() then
		view.close()
	else
		require("nvim-tree").open_replacing_current_buffer()
	end
end

vim.keymap.set("n", "-", toggle_replace)

-- Append common line ending.
vim.keymap.set("n", "<space>a,", "mzA,<esc>`z", default_options)
vim.keymap.set("n", "<space>a.", "mzA.<esc>`z", default_options)
vim.keymap.set("n", "<space>a;", "mzA;<esc>`z", default_options)

-- Buffer navigation.
vim.keymap.set("n", "<c-l>", "<c-w>l", default_options)
vim.keymap.set("n", "<c-h>", "<c-w>h", default_options)
vim.keymap.set("n", "<c-x>", ":bdelete<cr>", default_options)
