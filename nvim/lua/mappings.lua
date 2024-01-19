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
map("i", "<C-k>", "<Esc>")
map("n", "<C-k>", "<Esc>")
map("i", "<C-k>", "<Esc>")
map("v", "<C-k>", "<Esc>")
map("s", "<C-k>", "<Esc>")
map("x", "<C-k>", "<Esc>")
map("c", "<C-k>", "<Esc>")
map("o", "<C-k>", "<Esc>")
map("l", "<C-k>", "<Esc>")

-- Tab for switching between buffers
map("n", "<Tab>", "<C-w>w")

--enter norm mode
map("", "<C-n>", ":norm ")

--copy to clipboard
map("n", "<C-c>", '"+y')
map("v", "<C-c>", '"+y')

map("n", "<leader>w", ":w<CR>")
map("n", "<C-s>", ":w<CR>")
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
-- map("n", "<C-f>", ":sus<CR>")
-- map("v", "<C-f>", ":sus<CR>")
-- map("i", "<C-f>", ":sus<CR>")

map("n", "<up>", "<nop>")
map("n", "<down>", "<nop>")
map("n", "<left>", "<nop>")
map("n", "<right>", "<nop>")

--left and right can switch buffers
-- map("n", "<left>", ":bp<CR>")
-- map("n", "<right>", ":bn<CR>")
--integrate with barabar.nvim
map("n", "<right>", ":BufferNext<CR>")
map("n", "<left>", ":BufferPrevious<CR>")
map("n", "<leader>x", ":BufferClose<CR>")

--toggle between 2 buffers
map("n", "<leader>b", ":b#<CR>")
map("n", "\\\\", ":b#<CR>")
map("n", "<leader><Space>", ":b#<CR>")

--map('n', '<leader>e', ':e <C-R>=expand("%:p:h") . "/" <CR>')
map("n", "Y", "y$")

--fuzzy finder
map("n", "<C-P>", "<cmd>lua require('fzf-lua').files()<CR>")
map("n", "<C-]>", ":Gitsigns toggle_signs<CR>")
map("n", "<C-f>", ":FzfLua live_grep <CR>")
map("n", "<C-b>", ":FzfLua buffers <CR>")

--toggle transparency
map("n", "<F1>", ":TransparentToggle<CR>")

-- setup mapping to call :LazyGit
map("n", "<leader>g", ":LazyGit<CR>")

-- toggle nvim-tree
map("n", "<leader>n", ":NvimTreeToggle<CR>")

-- write qq to start recording
map("n", "<F5>", "@q") -- replay macro in register q
map("v", "<F5>", ":norm @q<CR>")

-- obsidian mappings
local home_path = vim.fn.expand("$HOME")
local vault_path = home_path .. "/obsidian/"
vim.api.nvim_create_autocmd({ "BufReadPre", "FileReadPre" }, {
	pattern = { vault_path .. "*" },
	callback = function()
		local buffer_name = vim.fn.expand("%:p")
		local workspace = buffer_name:match(vault_path .. "(.-)/")
		vim.cmd(string.format("ObsidianWorkspace %s", workspace))
		map("n", "<leader>o", ":ObsidianOpen<CR>")
		map("n", "<leader>pi", ":ObsidianPasteImg<CR>")
		map("n", "<C-f>", ":ObsidianSearch<CR>")
		map("n", "<C-n>", ":ObsidianNew<CR>")
	end,
})
