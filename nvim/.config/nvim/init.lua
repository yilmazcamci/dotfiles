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
			-- { "j-hui/fidget.nvim", opts = {} },

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

	-- Copilot
	require("plugin-sets.ai"),

	-- Useful plugin to show you pending keybinds.
	{ "folke/which-key.nvim",            opts = {} },

	-- Add colorschemes.
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

	-- require("plugins.telescope"),
	require("plugins.fzf-lua"),

	require("plugins.notify"),

	require("plugins.treesitter"),
	require("plugins.treesitter-textobjects"),

	require("plugins.nvim-tree"),

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
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},

	-- minimap bar on right side
	-- { "lewis6991/satellite.nvim",                   opts = {} },

	-- emmet for efficient html-like markup creation
	"mattn/emmet-vim",

	-- support tsx comments
	-- { "JoosepAlviste/nvim-ts-context-commentstring" },

	require("plugins.mini"),

	require("plugins.conjure"),
	require("plugins.fennel-vim"),

	require("plugin-sets.git"),

	require("plugin-sets.purescript"),

	"tpope/vim-commentary",

	require("plugins.rainbow_csv"),
}, {})

vim.cmd("colorscheme kanagawa")

require("configs.treesitter")

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
	vim.keymap.set("v", "<leader>la", vim.lsp.buf.code_action, { buffer = bufnr, desc = "[L]SP [C]ode Action" })
	nmap("<leader>lf", vim.lsp.buf.format, "[L]SP [f]ormat")

	nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
	-- nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
	-- nmap("gr", vim.lsp.buf.references, "[G]oto [R]eferences")
	nmap("gr", require("fzf-lua").lsp_references, "[G]oto [R]eferences")
	nmap("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
	nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
	-- nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
	-- nmap("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
	nmap("<leader>ds", require("fzf-lua").lsp_document_symbols, "[D]ocument [S]ymbols")
	nmap("<leader>ws", require("fzf-lua").lsp_workspace_symbols, "[W]orkspace [S]ymbols")

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
	nmap("gq", require("fixcurrent"), "[G]o [Q]uickfix")

	-- null-ls format on save
	-- formatting with lua lsp scrolls the buffer, we skip it
	local lua_buffer = vim.bo.filetype == "lua"
	if client.supports_method("textDocument/formatting") and (not lua_buffer) then
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.format({
					bufnr = bufnr,
					filter = function(filter_client)
						return filter_client.name ~= "tsserver"
					end,
				})
			end,
		})
	end

	-- TypeScript organize imports
	nmap("<leader>oi", function()
		vim.lsp.buf.execute_command({
			command = "_typescript.organizeImports",
			arguments = { vim.fn.expand("%:p") },
		})
	end, "[O]rganize [I]mports")
end

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
		-- Use clippy
		-- settings = {
		-- 	["rust-analyzer"] = {
		-- 		check = {
		-- 			command = "clippy",
		-- 			extraArgs = { "--all", "--", "-W", "clippy::all" },
		-- 		},
		-- 	},
		-- },
	},
})

local null_ls = require("null-ls")
null_ls.setup({
	sources = {
		-- null_ls.builtins.formatting.rustfmt,
		null_ls.builtins.code_actions.eslint_d,
		null_ls.builtins.diagnostics.eslint_d,
		null_ls.builtins.formatting.fnlfmt,
		null_ls.builtins.formatting.gofmt,
		null_ls.builtins.formatting.prettierd,
		null_ls.builtins.formatting.rustywind,
		-- null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.sqlfluff.with({
			extra_args = { "--dialect", "postgres" },
		}),
		null_ls.builtins.formatting.purs_tidy,
	},
	on_attach = on_attach,
})

require("configs.cmp")

require("keymaps.mod")
