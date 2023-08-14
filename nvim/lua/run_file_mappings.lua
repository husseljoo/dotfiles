local create_augroup = require("utils").create_augroup

local skeletons = {
	{ "BufNewFile", "*.py", "0r ~/.vim/templates/skeleton.py" },
	{ "BufNewFile", "*.go", "0r ~/.vim/templates/skeleton.go" },
	{ "BufNewFile", "*.dart", "0r ~/.vim/templates/skeleton.dart" },
	{ "BufNewFile", "*.html", "0r ~/.vim/templates/skeleton.html" },
	-- { "BufNewFile", "/home/husseljo/interview_preparation/*.py", "0r ~/.vim/templates/leetcode_skeleton.py" },
}
local printing = {
	{ "FileType", "python", 'vnoremap <leader>p <Esc>0wyiwoprint(f": {}")<Esc>0f:Pf{p' },
	{ "FileType", "python", 'nmap <leader>p <Esc>0wyiwoprint(f": {}")<Esc>0f:Pf{p' },
	{ "FileType", "rust", "nmap <buffer> \\p oprintln!();<Esc>$F)i" },
	{ "FileType", "rust", "nmap <buffer> \\P Oprintln!();<Esc>$F)i" },
}
local running_files = {
	{ "FileType", "python", "nnoremap <buffer> <F9> :wa<CR> :!python %<CR>" },
	{ "FileType", "go", "nnoremap <buffer> <F9> :wa<CR> :!go run %<CR>" },
	{ "FileType", "dart", "nnoremap <buffer> <F9> :wa<CR> :!dart run %<CR>" },
	{ "FileType", "rust", "nnoremap <buffer> <F9> :wa<CR> :!cargo run<CR>" },
}
local custom = {
	{ "FileType", "cpp", "setlocal shiftwidth=2 tabstop=2" },
}

create_augroup(skeletons, "skeletons")
create_augroup(printing, "printing")
create_augroup(running_files, "running_files")
create_augroup(custom, "custom")
