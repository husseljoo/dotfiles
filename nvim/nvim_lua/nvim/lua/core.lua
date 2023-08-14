local set = vim.opt

set.number = true
set.tabstop = 4
set.shiftwidth = 4
set.softtabstop = 0
set.expandtab = true
set.swapfile = false
set.relativenumber = true
set.signcolumn = "yes"
vim.api.nvim_set_hl(0, "SignColumn", { clear })
set.splitright = true
