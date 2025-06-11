-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
vim.lsp.enable({ "luals", "pyright", "gopls", "tsls" })
-- vim.lsp.enable({ "harperls" })
require("core.lsp_diagnostics")
