map = require("utils").map
vim.g.mapleader = " "

--ESCAPE MAPPING
map("i", "<C-j>", "<Esc>")
map("n", "<C-j>", "<Esc>")
map("i", "<C-j>", "<Esc>")
map("v", "<C-j>", "<Esc>")
map("s", "<C-j>", "<Esc>")
map("x", "<C-j>", "<Esc>")
map("c", "<C-j>", "<Esc>")
map("o", "<C-j>", "<Esc>")
map("l", "<C-j>", "<Esc>")
map("t", "<C-j>", "<Esc>")
map("i", "<C-k>", "<Esc>")
map("n", "<C-k>", "<Esc>")
map("i", "<C-k>", "<Esc>")
map("v", "<C-k>", "<Esc>")
map("s", "<C-k>", "<Esc>")
map("x", "<C-k>", "<Esc>")
map("c", "<C-k>", "<Esc>")
map("o", "<C-k>", "<Esc>")
map("l", "<C-k>", "<Esc>")
map("t", "<C-k>", "<Esc>")

--enter norm mode
map("", "<C-n>", ":norm ")

--copy to clipboard
map("n", "<C-c>", '"+y')
map("v", "<C-c>", '"+y')

map("n", "<leader>w", ":w<CR>")
map("n", "<leader>q", ":q!<CR>")
map("n", "<leader>s", ":w<CR>:so %<CR>")
map("n", "<leader>ev", ":vsplit $MYVIMRC<CR>")
map("n", "<leader>sv", ":w<CR>:so %<CR>:q<CR>")
map("n", "<leader>l", ":noh<CR>")
map("n", "\\<Space>", ":noh<CR>")
map("n", "<leader>v", ":vsplit ")

--do custom mapping for F4
map("", "<leader>m", ":map <F4> ")
-- map("", "<C-m>", ":map <F4> ")

--Ctrl+h to stop searching
map("v", "<C-h>", ":nohlsearch<CR>")
map("n", "<C-h>", ":nohlsearch<CR>")

--suspend
map("n", "<C-f>", ":sus<CR>")
map("v", "<C-f>", ":sus<CR>")
map("i", "<C-f>", ":sus<CR>")

map("n", "<up>", "<nop>")
map("n", "<down>", "<nop>")
map("n", "<left>", "<nop>")
map("n", "<right>", "<nop>")

--left and right can switch buffers
map("n", "<left>", ":bp<CR>")
map("n", "<right>", ":bn<CR>")
--toggle between 2 buffers
map("n", "<leader>b", ":b#<CR>")
map("n", "\\\\", ":b#<CR>")
map("n", "<leader><Space>", ":b#<CR>")

--map('n', '<leader>e', ':e <C-R>=expand("%:p:h") . "/" <CR>')
map("n", "Y", "y$")

--fuzzy finder
map("n", "<c-P>", "<cmd>lua require('fzf-lua').files()<CR>")
map("n", "<c-]>", ":FzfLua live_grep <CR>")

--toggle transparency
map("n", "<F1>", ":TransparentToggle<CR>")
