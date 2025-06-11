local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
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

return require("lazy").setup({
  "neovim/nvim-lspconfig",
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  "onsails/lspkind.nvim",
  "L3MON4D3/LuaSnip",
  -- "nvim-lua/plenary.nvim",
  -- {
  -- 	"jose-elias-alvarez/null-ls.nvim",
  -- 	dependencies = { "nvim-lua/plenary.nvim" },
  -- },
  -- {
  -- 	"jay-babu/mason-null-ls.nvim",
  -- 	dependencies = { "williamboman/mason.nvim", "jose-elias-alvarez/null-ls.nvim" },
  -- },
  {
    "mason-org/mason.nvim",
    opts = {},
  },
  {
    "stevearc/conform.nvim",
    opts = {},
  },
  -- {
  -- 	"VonHeikemen/lsp-zero.nvim",
  -- 	branch = "v2.x",
  -- 	dependencies = {
  -- 		-- LSP Support
  -- 		{ "neovim/nvim-lspconfig" }, -- Required
  -- 		{ -- Optional
  -- 			"williamboman/mason.nvim",
  -- 			build = function()
  -- 				pcall(vim.cmd, "MasonUpdate")
  -- 			end,
  -- 		},
  -- 		{ "williamboman/mason-lspconfig.nvim" }, -- Optional

  -- 		-- Autocompletion
  -- 		{ "hrsh7th/nvim-cmp" }, -- Required
  -- 		{ "hrsh7th/cmp-nvim-lsp" }, -- Required
  -- 		{ "L3MON4D3/LuaSnip" }, -- Required
  -- 	},
  -- },
  -- {
  -- 	"williamboman/mason.nvim",
  -- 	build = ":MasonUpdate",
  -- },
  -- "williamboman/mason-lspconfig.nvim",
  "kyazdani42/nvim-web-devicons",
  "machakann/vim-highlightedyank",
  "vim-airline/vim-airline",
  "vim-airline/vim-airline-themes",
  "tpope/vim-commentary",
  "junegunn/fzf.vim",
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  --colorscheme plugins
  "ellisonleao/gruvbox.nvim",
  "EdenEast/nightfox.nvim",
  "xiyaowong/transparent.nvim",
  {
    "nvim-treesitter/nvim-treesitter",
    build = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
  },
  {
    "luukvbaal/nnn.nvim",
    config = function()
      require("nnn").setup()
    end,
  },
  {
    "kdheepak/lazygit.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  {
    "kyazdani42/nvim-tree.lua",
    dependencies = {
      "kyazdani42/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup()
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
  },
  "romgrk/barbar.nvim",
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup()
    end,
  },
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-buffer",
  { "glacambre/firenvim", build = ":call firenvim#install(0)" },
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-q>", "<cmd>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      -- { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-o>", "<cmd>TmuxNavigatePrevious<cr>" },
    },
  },
  {
    "cameron-wags/rainbow_csv.nvim",
    config = true,
    ft = {
      "csv",
      "tsv",
      "csv_semicolon",
      "csv_whitespace",
      "csv_pipe",
      "rfc_csv",
      "rfc_semicolon",
    },
    cmd = {
      "RainbowDelim",
      "RainbowDelimSimple",
      "RainbowDelimQuoted",
      "RainbowMultiDelim",
    },
  },
  -- {
  -- 	"m4xshen/autoclose.nvim",
  -- 	config = function()
  -- 		require("autoclose").setup()
  -- 	end,
  -- },
  --
  -- "christoomey/vim-tmux-navigator",
  -- add copilot
  -- {
  -- 	"zbirenbaum/copilot.lua",
  -- 	cmd = "Copilot",
  -- 	event = "InsertEnter",
  -- 	config = function()
  -- 		require("copilot").setup({
  -- 			suggestion = { enabled = false },
  -- 			panel = { enabled = false },
  -- 		})
  -- 	end,
  -- },
  -- {
  -- 	"zbirenbaum/copilot-cmp",
  -- 	dependencies = { "copilot.lua" },
  -- 	config = function()
  -- 		require("copilot_cmp").setup()
  -- 	end,
  -- },
  -- {
  -- 	"epwalsh/obsidian.nvim",
  -- 	version = "*", -- use latest release instead of latest commit
  -- 	dependencies = { "nvim-lua/plenary.nvim" },
  -- 	config = require("obsidian_config"),
  -- },
})
