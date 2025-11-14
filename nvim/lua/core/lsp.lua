-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
vim.lsp.enable({ "luals", "pyright", "gopls", "tsls", "clangd", "ansiblels", "terraformls" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { noremap = true, silent = true })
-- vim.lsp.enable({ "harperls" })
require("core.lsp_diagnostics")
