map = require("utils").map
-- terminal mode mappings
-- map("t", "<C-w>", "<C-\\><C-n><C-w>") --could be handy for unification, however I rely on C-w word delete too much
-- map("t", "<C-j>", "<C-\\><C-n>") -- regular escape
-- map("t", "<C-k>", "<C-\\><C-n>") -- regular escape
-- map("t", "<Esc>", "<C-\\><C-n><C-w>w")
-- vim.cmd("autocmd BufWinEnter,WinEnter,BufEnter term://*[^lazygit] startinsert")

-- vim.api.nvim_create_autocmd({ "TermOpen", "TermEnter" }, {
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter", "WinEnter" }, {
	pattern = { "*toggleterm*" },
	callback = function()
		vim.cmd("startinsert")
		map("t", "<Esc>", "<C-\\><C-n>") -- regular escape
		-- map("t", "<C-j>", "<C-\\><C-n><C-w>w") -- leave terminal
	end,
})

-- toggle terminal
map("n", "<leader>t", ":ToggleTerm direction=float<CR>")
map("n", "<C-t>", ":ToggleTerm size=17<CR>")
