-- Auto run Packer after plugins update.
vim.cmd([[
  augroup packer_user_config
	autocmd!
	autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require("packer").startup(function(use)
	use({ "wbthomason/packer.nvim" })

	-- Post-install/update hook with neovim command
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	})

	-- Language
	use("williamboman/mason.nvim") -- Manage language server plugins?
	use("williamboman/mason-lspconfig.nvim") -- ??
	use("neovim/nvim-lspconfig")

	-- Autocompletion.
	use("hrsh7th/nvim-cmp")
	-- LSP source for nvim-cmp.
	use("hrsh7th/cmp-nvim-lsp")

	-- Useful completion sources:
	use("hrsh7th/cmp-nvim-lua")
	use("hrsh7th/cmp-nvim-lsp-signature-help")
	use("hrsh7th/cmp-vsnip")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/vim-vsnip")
	use("saadparwaiz1/cmp_luasnip")

	-- Kind symbol in LSP pop-over menu.
	use("onsails/lspkind.nvim")

	-- Snippets
	use("L3MON4D3/LuaSnip")
	use("rafamadriz/friendly-snippets")

	-- Hint codeactions are available.
	use({
		"kosayoda/nvim-lightbulb",
		requires = "antoinemadec/FixCursorHold.nvim",
	})

	-- Rust
	use("simrat39/rust-tools.nvim")
	-- Debugging
	use("nvim-lua/plenary.nvim")
	use("mfussenegger/nvim-dap")

	use("jose-elias-alvarez/null-ls.nvim")

	-- use({
	--   'glepnir/galaxyline.nvim',
	--   branch = 'main',
	--   -- your statusline
	--   config = function()
	--     -- require('my_statusline')
	--   end,
	--   -- some optional icons
	--   -- requires = { 'kyazdani42/nvim-web-devicons', opt = true },
	-- })

	use("nvim-lualine/lualine.nvim")

	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use({ "nvim-telescope/telescope-ui-select.nvim" })

	-- use({
	-- 	"ibhagwan/fzf-lua",
	-- 	-- See: https://github.com/jose-elias-alvarez/null-ls.nvim/wiki/Compatibility-with-other-plugins
	-- 	-- TODO: check if this is really needed.
	-- 	lsp = {
	-- 		async_or_timeout = 3000,
	-- 	},
	-- 	-- optional for icon support
	-- 	-- requires = { 'kyazdani42/nvim-web-devicons' }
	-- })

	use("tpope/vim-surround")

	-- git in editor
	use("tpope/vim-fugitive")

	-- comments
	use("tpope/vim-commentary")

	-- shortcuts for common vim actions that come in a pair.
	use("tpope/vim-unimpaired")

	-- use({
	--   'francoiscabrol/ranger.vim',
	--   requires = 'rbgrouleff/bclose.vim'
	-- })

	-- Base16 colorschemes. Would be nice to replace with "just use the terminal colors".
	use("RRethy/nvim-base16")

	-- Better %
	-- use 'andymass/vim-matchup'

	use("mg979/vim-visual-multi")

	use("mihaifm/bufstop") -- Faster buffer switching.

	use("tpope/vim-sleuth") -- Indent using smart indent detection.

	use("lukas-reineke/indent-blankline.nvim")

	use("kyazdani42/nvim-tree.lua")

	use("lewis6991/gitsigns.nvim") -- easily spot which changes you've made in a git-tracked buffer.

	-- use 'psliwka/vim-smoothie' -- smooth scrolling

	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})

	-- Rust crates.io
	use({
		"saecki/crates.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("crates").setup()
		end,
	})

	-- Color hex codes in own color.
	use("norcalli/nvim-colorizer.lua")

	-- TypeScript JSX commenting based on context.
	use("JoosepAlviste/nvim-ts-context-commentstring")

	-- Notify of things.
	use("rcarriga/nvim-notify")

	-- Track and restore session
	use({
		"rmagatti/auto-session",
		config = function()
			require("auto-session").setup({
				log_level = "error",
			})
		end,
	})
end)