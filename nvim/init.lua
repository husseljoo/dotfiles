vim.g.mapleader = " "
vim.g.neovim_mode = vim.env.NEOVIM_MODE or "default"

require("core.lsp")
require("core.lazy")
-- require("plugins_loader")
-- require("lsp_config")
-- require("lsp-zero-config")
require("config.base")
require("config.colorscheme")
require("config.mappings")
require("config.autocmds")
-- require("terminal")
require("config.run_file_mappings")
require("flutter-tools").setup({})
