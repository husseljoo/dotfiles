-- require("lsp_config")
require("lsp-zero-config")
require("core")
require("mappings")
require("run_file_mappings")
require("colorscheme_config")

return require("packer").startup(function(use)
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
		requires = { "nvim-tree/nvim-web-devicons" },
	})
	--colorscheme plugins
	use("ellisonleao/gruvbox.nvim")
	use("EdenEast/nightfox.nvim")
	use("xiyaowong/transparent.nvim")
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})
	use({
		"luukvbaal/nnn.nvim",
		config = function()
			require("nnn").setup()
		end,
	})
	use({
		"kdheepak/lazygit.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})
	use({
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons",
		},
		config = function()
			require("nvim-tree").setup()
		end,
	})
	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	})
	use("romgrk/barbar.nvim")
	use({
		"akinsho/toggleterm.nvim",
		tag = "*",
		config = function()
			require("toggleterm").setup()
		end,
	})
	use("mfussenegger/nvim-jdtls")
	use({
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				suggestion = { enabled = false },
				panel = { enabled = false },
			})
		end,
	})
	use({
		"zbirenbaum/copilot-cmp",
		after = { "copilot.lua" },
		config = function()
			require("copilot_cmp").setup()
		end,
	})
end)
