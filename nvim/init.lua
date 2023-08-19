-- require("lsp_config")
require("lsp-zero-config")
require("core")
require("mappings")
require("run_file_mappings")
require("colorscheme_config")

return require("packer").startup(function()
	use("wbthomason/packer.nvim")
	use("neovim/nvim-lspconfig")
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")
	use("onsails/lspkind.nvim")
	use("L3MON4D3/LuaSnip")
	use("nvim-lua/plenary.nvim")
	use({
		"jose-elias-alvarez/null-ls.nvim",
		requires = { "nvim-lua/plenary.nvim" },
	})
	use({
		"jay-babu/mason-null-ls.nvim",
		requires = {
			"williamboman/mason.nvim",
			"jose-elias-alvarez/null-ls.nvim",
		},
	})
	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{ -- Optional
				"williamboman/mason.nvim",
				run = function()
					pcall(vim.cmd, "MasonUpdate")
				end,
			},
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{ "L3MON4D3/LuaSnip" }, -- Required
		},
	})
	use({
		"williamboman/mason.nvim",
		run = ":MasonUpdate", -- :MasonUpdate updates registry contents
	})
	use("williamboman/mason-lspconfig.nvim")
	use("kyazdani42/nvim-web-devicons")
	use("machakann/vim-highlightedyank")
	use("vim-airline/vim-airline")
	use("vim-airline/vim-airline-themes")
	use("tpope/vim-commentary")
	use("junegunn/fzf.vim")
	use({
		"ibhagwan/fzf-lua",
		-- optional for icon support
		requires = { "nvim-tree/nvim-web-devicons" },
	})
	--colorscheme plugins
	use("ellisonleao/gruvbox.nvim")
	-- use({ "catppuccin/nvim", as = "catppuccin" })
	-- use("ray-x/aurora")
	use("EdenEast/nightfox.nvim")
	-- use("folke/lsp-colors.nvim")
	use("xiyaowong/transparent.nvim")
	--use 'tiagofumo/vim-nerdtree-syntax-highlight'
	--use 'tpope/vim-fugitive'
	--use 'morhetz/gruvbox'
	--use {
	--  'nvim-lualine/lualine.nvim',
	--  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	--}
	-- install without yarn or npm
	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})
	use({
		"mfussenegger/nvim-jdtls",
		config = function()
			-- https://github.com/fitrh/init.nvim/blob/main/lua/plugin/jdtls/config.lua
			require("plugin.jdtls.config").attach()
		end,
		module = "jdtls",
	})
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})
	use({
		"akinsho/flutter-tools.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
			"stevearc/dressing.nvim", -- optional for vim.ui.select
		},
	})

	-- use({
	-- 	"akinsho/toggleterm.nvim",
	-- 	tag = "*",
	-- 	keys = {
	-- 		{
	-- 			"<leader>td",
	-- 			"<cmd>ToggleTerm size=40 dir=~ direction=horizontal<CR>",
	-- 			desc = "Open a horizontal terminal at the Desktop directory",
	-- 		},
	-- 	},
	-- 	config = function()
	-- 		require("toggleterm").setup()
	-- 	end,
	-- })
end)