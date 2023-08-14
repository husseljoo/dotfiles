local lsp = require("lsp-zero").preset({})

lsp.on_attach(function(client, bufnr)
	lsp.default_keymaps({ buffer = bufnr })
end)

-- (Optional) Configure lua language server for neovim
require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()

vim.diagnostic.config({
	-- virtual_text = false,
})

local cmp = require("cmp")
local cmp_action = require("lsp-zero").cmp_action()
local signs = { Error = " ", Warn = " ", Hint = "", Info = "" }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

cmp.setup({
	mapping = {
		["<CR>"] = cmp.mapping.confirm({ select = false }),
		["<Tab>"] = cmp_action.luasnip_supertab(),
		["<S-Tab>"] = cmp_action.luasnip_shift_supertab(),
	},
	formatting = {
		format = require("lspkind").cmp_format({ mode = "symbol" }),
		maxwidth = 50, -- prevent the popup from showing more than provided characters
		ellipsis_char = "...", --when maxwidth exceeded, truncated part shows ellipsis_char instead
	},
})

lsp.format_on_save({
	format_opts = {
		async = false,
		timeout_ms = 10000,
	},
	servers = {
		["null-ls"] = {
			"javascript",
			"typescript",
			"lua",
			"python",
			"go",
			"rust",
			"bash",
			"yaml",
			"html",
			"markdown",
			"haskell",
			"java",
			"json",
			"dart",
			"cpp",
		},
	},
})

--null-ls to add formatters and linters as if they were language servers
local null_ls = require("null-ls")
null_ls.setup({
	sources = {
		-- formatting
		null_ls.builtins.formatting.prettier,
		null_ls.builtins.formatting.black,
		null_ls.builtins.formatting.shfmt,
		null_ls.builtins.formatting.goimports,
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.htmlbeautifier,
		null_ls.builtins.formatting.cbfmt,
		null_ls.builtins.formatting.fourmolu,
		null_ls.builtins.formatting.clang_format,
		null_ls.builtins.formatting.dart_format,
		-- linting
		-- null_ls.builtins.diagnostics.flake8,
	},
})
--use mason-null-ls.nvim to integrate mason and null-ls
require("mason-null-ls").setup({
	ensure_installed = nil,
	automatic_installation = true,
})

require("nvim-treesitter.configs").setup({
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
})

require("lsp-colors").setup({
	Error = "#db4b4b",
	Warning = "#e0af68",
	Information = "#0db9d7",
	Hint = "#10B981",
})

local dart_lsp = lsp.build_options("dartls", {})

require("flutter-tools").setup({
	lsp = {
		capabilities = dart_lsp.capabilities,
	},
})
