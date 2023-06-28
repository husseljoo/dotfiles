-- require("lsp_config")
require("lsp-zero-config")
require("core")
require("mappings")


return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'onsails/lspkind.nvim'
  use 'L3MON4D3/LuaSnip'
  use 'nvim-lua/plenary.nvim'
  use {
      'jose-elias-alvarez/null-ls.nvim',
      requires={'nvim-lua/plenary.nvim'}
  }
  use {
    'jay-babu/mason-null-ls.nvim',
    requires = {
       'williamboman/mason.nvim',
       'jose-elias-alvarez/null-ls.nvim', },
   }
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {                                      -- Optional
        'williamboman/mason.nvim',
        run = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},     -- Required
      {'hrsh7th/cmp-nvim-lsp'}, -- Required
      {'L3MON4D3/LuaSnip'},     -- Required
    }
}
  use {
    "williamboman/mason.nvim",
    run = ":MasonUpdate" -- :MasonUpdate updates registry contents
}
  use 'williamboman/mason-lspconfig.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use 'machakann/vim-highlightedyank'
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
  use 'tpope/vim-commentary'
  use 'junegunn/fzf.vim'
  use { 'ibhagwan/fzf-lua',
      -- optional for icon support
      requires = { 'nvim-tree/nvim-web-devicons' }
}
  --use 'tiagofumo/vim-nerdtree-syntax-highlight'
  --use 'tpope/vim-fugitive'
  --use 'morhetz/gruvbox'
  --use {
  --  'nvim-lualine/lualine.nvim',
  --  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  --}
end)
