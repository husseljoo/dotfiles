local create_augroup = require("utils").create_augroup

local run_commands = {
	{ "python", "python %" },
	{ "go", "go run %" },
	{ "rust", "cargo run" },
	{ "dart", "dart run %" },
	{ "cpp", "g++ % -o %:r && ./%:r<CR>:!rm %:r" },
}
local skeleton_langs = { "py", "dart", "html", "go", "cpp" }
local base = "0r ~/.vim/templates/skeleton."

local custom = {
	{ "FileType", "cpp", "setlocal shiftwidth=2 tabstop=2" },
}

----------------------------------------------------------------
----------------------------------------------------------------

local function generate_skeletons()
	local res = {}
	for _, lang in ipairs(skeleton_langs) do
		local x = { "BufNewFile", "*." .. lang, base .. lang }
		table.insert(res, x)
	end
	return res
end

local function run_files()
	local res = {}
	for _, val in ipairs(run_commands) do
		local x = { "FileType", val[1], "nnoremap <buffer> <F9> :wa<CR> :!" .. val[2] .. "<CR>" }
		table.insert(res, x)
	end
	return res
end

local skeletons = generate_skeletons()
local running_files = run_files()

local printing = {
	{ "FileType", "python", 'vnoremap <leader>p <Esc>0wyiwoprint(f": {}")<Esc>0f:Pf{p' },
	{ "FileType", "python", 'nmap <leader>p <Esc>0wyiwoprint(f": {}")<Esc>0f:Pf{p' },
	{ "FileType", "rust", "nmap <buffer> \\p oprintln!();<Esc>$F)i" },
	{ "FileType", "rust", "nmap <buffer> \\P Oprintln!();<Esc>$F)i" },
}

create_augroup(skeletons, "skeletons")
create_augroup(printing, "printing")
create_augroup(running_files, "running_files")
create_augroup(custom, "custom")
