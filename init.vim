" Fish doesn't play all that well with others
set shell=/bin/bash
let $BASH_ENV = "~/.vim_bash_env"
let mapleader = "\<Space>"
" =============================================================================
" # PLUGINS
" =============================================================================
" Load vundle
set nocompatible
filetype off
" set rtp+=~/dev/others/base16/templates/vim/
call plug#begin('~/.vim/plugged')
" call plug#begin()

Plug 'tpope/vim-commentary'
Plug 'morhetz/gruvbox'

" Load plugins
" VIM enhancements
Plug 'ciaranm/securemodelines'
Plug 'editorconfig/editorconfig-vim'
"Plug 'justinmk/vim-sneak'

" GUI enhancements
Plug 'itchyny/lightline.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'andymass/vim-matchup'

" Fuzzy finder
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Semantic language support
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/lsp_extensions.nvim'
" Plug 'nvim-lua/completion-nvim'

"new autocomplete?
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/vim-vsnip'

" Syntactic language support
Plug 'cespare/vim-toml'
Plug 'stephpy/vim-yaml'
Plug 'rust-lang/rust.vim'
Plug 'rhysd/vim-clang-format'
"Plug 'fatih/vim-go'
Plug 'dag/vim-fish'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'lervag/vimtex'
" Plug 'xuhdev/vim-latex-live-preview'

Plug 'preservim/nerdtree'
Plug 'kabouzeid/nvim-lspinstall'
" Plug 'ryanoasis/vim-devicons'
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

Plug 'pangloss/vim-javascript'
Plug 'tomasiser/vim-code-dark'

"Auto-save
Plug '907th/vim-auto-save'
Plug 'joereynolds/sql-lint'

"Haskell
Plug 'neovimhaskell/haskell-vim'
Plug 'alx741/vim-hindent'

"Formatter
Plug 'mhartington/formatter.nvim'

"Diagnostics
" Plug 'folke/lsp-colors.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/trouble.nvim'

"Javascript
Plug 'turbio/bracey.vim', {'do': 'npm install --prefix server'}

"Emmet
Plug 'mattn/emmet-vim'

"Surround
Plug 'tpope/vim-surround'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'

"emf-langserver
" Plug 'mattn/efm-langserver'

"multiple cursors
" Plug 'mg979/vim-visual-multi'
"Colorschemes
Plug 'sjl/badwolf'
Plug 'sainnhe/sonokai'
"Assembly
Plug 'harenome/vim-mipssyntax'
"vimwiki
Plug 'vimwiki/vimwiki'
"JSX
Plug 'MaxMEllon/vim-jsx-pretty'
"Git
Plug 'christoomey/vim-conflicted'
"Searchbox
Plug 'MunifTanjim/nui.nvim'
Plug 'VonHeikemen/searchbox.nvim'
Plug 'sudar/vim-arduino-syntax'


"git diff
" Plug 'airblade/vim-gitgutter'

call plug#end()
let g:hindent_on_save = 1

" let g:livepreview_previewer = 'open -a zathura'
autocmd Filetype tex setl updatetime=1


" copy to clipboard with ctrl+c
map <C-c> "+y

nnoremap <Leader><space> :noh<CR>

nmap <C-_> gcc 
inoremap <C-_> gcc 
vnoremap <C-_> gcc 
nnoremap <C-_> gcc 


autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>


"experimenting with Latex
map <F5> :w \| :! pdflatex %<CR><CR>
map <F6> :w \| :! zathura $(echo % \| sed 's/tex$/pdf/') & disown <CR>


nnoremap \<Space> :noh<CR>
" nnoremap <F9> :!%:p<CR>
" nnoremap <leader>r :!%:p<CR>

let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

if has('nvim')
set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor
set inccommand=nosplit
noremap <C-q> :confirm qall<CR>
end

" deal with colors
if !has('gui_running')
set t_Co=256
endif
if (match($TERM, "-256color") != -1) && (match($TERM, "screen-256color") == -1)
" screen does not (yet) support truecolor
set termguicolors
endif
set background=dark
let base16colorspace=256
" let g:base16_shell_path="~/dev/others/base16/templates/shell/scripts/"
syntax on

hi Normal ctermbg=NONE
" LSP configuration
lua << END
local lspconfig = require('lspconfig')
local on_attach = function(client, bufnr)
vim.api.nvim_command[[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()]]
local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

--Enable completion triggered by <c-x><c-o>
--buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')


-- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      expand = function(args)
        -- For `vsnip` user.
        vim.fn["vsnip#anonymous"](args.body)

        -- For `luasnip` user.
        -- require('luasnip').lsp_expand(args.body)

        -- For `ultisnips` user.
        -- vim.fn["UltiSnips#Anon"](args.body)
      end,
    },
    mapping = {
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = {
      { name = 'nvim_lsp' },
      { name = 'buffer' },
    }
  })

  -- Setup lspconfig.
-- require('lspconfig')['denols'].setup {
--   capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- }

--local servers = { "rust_analyzer", "pyright", "tsserver" }
--for _, lsp in ipairs(servers) do
--lspconfig[lsp].setup {
--    capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
--}
--end




-- Mappings.
local opts = { noremap=true, silent=true }

-- See `:help vim.lsp.*` for documentation on any of the below functions
buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
buf_set_keymap('n', '<space>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

-- Forward to other plugins
--require'completion'.on_attach(client)
end

--tsserver replaced with denols for now
local servers = { "rust_analyzer", "pyright",  "vimls", "ccls", "hls", "gopls","tsserver"} 
for _, lsp in ipairs(servers) do
lspconfig[lsp].setup { on_attach = on_attach, flags = {
debounce_text_changes = 150,
}
}
end



--lspconfig.denols.setup {
--  on_attach = on_attach,
--  flags = {
--    debounce_text_changes = 150,
--    config = './deno.json',
--  },
--  filetypes = {
--    'javascript',
--    'javascriptreact',
--    'javascript.jsx',
--    'typescript',
--    'typescriptreact',
--    'typescript.tsx',
--    'markdown',
--  },
--  init_options = {
--    config = '/home/husseljo/.config/nvim/deno.json',
--    lint = true,
--  },
--}



--require('lspconfig')['denols'].setup {
--  capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
--  lint=true,
--}

--require'lspconfig'.denols.setup{ lint=true }

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
vim.lsp.diagnostic.on_publish_diagnostics, {
virtual_text = true,
signs = true,
update_in_insert = tre,
}
)
-- Prettier function for formatter
local prettier = function()
  return {
    exe = "prettier",
    args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0), "--double-quote" },
    stdin = true,
  }
end

-- Prettier function for formatter for Python
local black = function()
  return {
    exe = "black",
    --args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0), "--double-quote" },
    stdin = false,
  }
end

--vim.api.nvim_command[[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()]]

require("formatter").setup({
  logging = false,
  filetype = {
    javascript = { prettier },
    json = { prettier },
    typescript = { prettier },
    html = { prettier },
    css = { prettier },
    scss = { prettier },
    markdown = { prettier },
    python = {black},
    javascriptreact = {  
        -- prettier
        function()
          return {
            exe = "prettier",
            args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
            stdin = true
          }
        end},
  },
})


--Enable formatter for Neovim
vim.api.nvim_exec([[
augroup FormatAutogroup
  autocmd!
	  autocmd BufWritePost *.js,*.py,*.lua,*.html,*.css,*.json,*.md FormatWrite
	augroup END
]], true)


--nvim_lsp.diagnosticls.setup {
--	filetypes = {"javascript", "javascriptreact", "typescript", "typescriptreact", "css"},
--	init_options = {
--	filetypes = {
--	javascript = "eslint",
--	typescript = "eslint",
--	javascriptreact = "eslint",
--	typescriptreact = "eslint" },
--	linters = {
--		eslint = {
--		sourceName = "eslint",
--		command = "./node_modules/.bin/eslint",
--		rootPatterns = {
--		".eslitrc.js",
--		"package.json"
--	},
--	debounce = 100,
--	args = {
--		"--cache",
--		"--stdin",
--		"--stdin-filename",
--		"%filepath",
--		"--format",
--		"json"
--	},
--	parseJson = {
--		errorsRoot = "[0].messages",
--		line = "line",
--		column = "column",
--		endLine = "endLine",
--		endColumn = "endColumn",
--		message = "${message} [${ruleId}]",
--		security = "severity"
--	},
--	securities = {
--		[2] = "error",
--		[1] = "warning"
--		}
--	} } }}

--require("lsp-colors").setup({
--  Error = "#db4b4b",
--  Warning = "#e0af68",
--  Information = "#0db9d7",
--  Hint = "#10B981"
--})

require("trouble").setup{}

END


" Plugin settings
let g:secure_modelines_allowed_items = [
	\ "textwidth",   "tw",
	\ "softtabstop", "sts",
	\ "tabstop",     "ts",
	\ "shiftwidth",  "sw",
	\ "expandtab",   "et",   "noexpandtab", "noet",
	\ "filetype",    "ft",
	\ "foldmethod",  "fdm",
	\ "readonly",    "ro",   "noreadonly", "noro",
	\ "rightleft",   "rl",   "norightleft", "norl",
	\ "colorcolumn"
	\ ]

" Lightline
let g:lightline = {
\ 'active': {
\   'left': [ [ 'mode', 'paste' ],
\             [ 'readonly', 'filename', 'modified' ] ],
\   'right': [ [ 'lineinfo' ],
\              [ 'percent' ],
\              [ 'fileencoding', 'filetype' ] ],
\ },
\ 'component_function': {
\   'filename': 'LightlineFilename'
\ },
\ }
function! LightlineFilename()
return expand('%:t') !=# '' ? @% : '[No Name]'
endfunction

" from http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
if executable('ag')
set grepprg=ag\ --nogroup\ --nocolor
endif
if executable('rg')
set grepprg=rg\ --no-heading\ --vimgrep
set grepformat=%f:%l:%c:%m
endif

" Javascript
let javaScript_fold=0

" Java
let java_ignore_javadoc=1

" Latex
let g:latex_indent_enabled = 1
let g:latex_fold_envs = 0
let g:latex_fold_sections = []

" Open hotkeys
map <C-p> :Files<CR>
nmap <leader>; :Buffers<CR>

" Quick-save
nmap <leader>w :w<CR>

" Don't confirm .lvimrc
let g:localvimrc_ask = 0

" rust
let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0
let g:rust_clip_command = 'xclip -selection clipboard'

" Completion
" Better completion
" menuone: popup even when there's only one match
" noinsert: Do not insert text until a selection is made
" noselect: Do not select, force user to select one from the menu
set completeopt=menuone,noinsert,noselect
" Better display for messages
set cmdheight=2
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300


" =============================================================================
" # Editor settings
" =============================================================================
filetype plugin indent on
set autoindent
set timeoutlen=300 " http://stackoverflow.com/questions/2158516/delay-before-o-opens-a-new-line
set encoding=utf-8
set scrolloff=2
set noshowmode
set hidden
set nowrap
set nojoinspaces
let g:sneak#s_next = 1
let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_auto_insert_bullets = 0
let g:vim_markdown_frontmatter = 1
set printfont=:h10
set printencoding=utf-8
set printoptions=paper:letter
" Always draw sign column. Prevent buffer moving when adding/deleting sign.
set signcolumn=yes

" Settings needed for .lvimrc
set exrc
set secure

" Sane splits
set splitright
set splitbelow

" Permanent undo
set undodir=~/.vimdid
set undofile

" Decent wildmenu
set wildmenu
set wildmode=list:longest
set wildignore=.hg,.svn,*~,*.png,*.jpg,*.gif,*.settings,Thumbs.db,*.min.js,*.swp,publish/*,intermediate/*,*.o,*.hi,Zend,vendor

" Use wide tabs
set shiftwidth=8
set softtabstop=8
set tabstop=8
set noexpandtab

" Wrapping options
set formatoptions=tc " wrap text and comments using textwidth
set formatoptions+=r " continue comments when pressing ENTER in I mode
set formatoptions+=q " enable formatting of comments with gq
set formatoptions+=n " detect lists for formatting
set formatoptions+=b " auto-wrap in insert mode, and do not wrap old long lines

" Proper search
set incsearch
set ignorecase
set smartcase
set gdefault

" Search results centered please
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" Very magic by default
nnoremap ? ?\v
nnoremap / /\v
cnoremap %s/ %sm/

" =============================================================================
" # GUI settings
" =============================================================================
set guioptions-=T " Remove toolbar
set vb t_vb= " No more beeps
set backspace=2 " Backspace over newlines
set nofoldenable
set ttyfast
" https://github.com/vim/vim/issues/1735#issuecomment-383353563
set lazyredraw
set synmaxcol=500
set laststatus=2
set relativenumber " Relative line numbers
set number " Also show current absolute line
set diffopt+=iwhite " No whitespace in vimdiff
" Make diffing better: https://vimways.org/2018/the-power-of-diff/
set diffopt+=algorithm:patience
set diffopt+=indent-heuristic
" set colorcolumn=80 " and give me a colored column
set showcmd " Show (partial) command in status line.
set mouse=a " Enable mouse usage (all modes) in terminals
set shortmess+=c " don't give |ins-completion-menu| messages.

" Show those damn hidden characters
" Verbose: set listchars=nbsp:¬,eol:¶,extends:»,precedes:«,trail:•
set listchars=nbsp:¬,extends:»,precedes:«,trail:•

" =============================================================================
" # Keyboard shortcuts
" =============================================================================

" Ctrl+j and Ctrl+k as Esc
" Ctrl-j is a little awkward unfortunately:
" https://github.com/neovim/neovim/issues/5916
" So we also map Ctrl+k
nnoremap <C-j> <Esc>
inoremap <C-j> <Esc>
vnoremap <C-j> <Esc>
snoremap <C-j> <Esc>
xnoremap <C-j> <Esc>
cnoremap <C-j> <C-c>
onoremap <C-j> <Esc>
lnoremap <C-j> <Esc>
tnoremap <C-j> <Esc>

nnoremap <C-k> <Esc>
inoremap <C-k> <Esc>
vnoremap <C-k> <Esc>
snoremap <C-k> <Esc>
xnoremap <C-k> <Esc>
cnoremap <C-k> <C-c>
onoremap <C-k> <Esc>
lnoremap <C-k> <Esc>
tnoremap <C-k> <Esc>

" Ctrl+h to stop searching
vnoremap <C-h> :nohlsearch<cr>
nnoremap <C-h> :nohlsearch<cr>

" Suspend with Ctrl+f
inoremap <C-f> :sus<cr>
vnoremap <C-f> :sus<cr>
nnoremap <C-f> :sus<cr>

" Jump to start and end of line using the home row keys
map H ^
map L $

" Neat X clipboard integration
" ,p will paste clipboard into buffer
" ,c will copy entire buffer into clipboard
noremap <leader>p :read !xsel --clipboard --output<cr>
noremap <leader>c :w !xsel -ib<cr><cr>

" <leader>s for Rg search
" noremap <leader>s :Rg
let g:fzf_layout = { 'down': '~20%' }
command! -bang -nargs=* Rg
\ call fzf#vim#grep(
\   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
\   <bang>0 ? fzf#vim#with_preview('up:60%')
\           : fzf#vim#with_preview('right:50%:hidden', '?'),
\   <bang>0)

function! s:list_cmd()
let base = fnamemodify(expand('%'), ':h:.:S')
return base == '.' ? 'fd --type file --follow' : printf('fd --type file --follow | proximity-sort %s', shellescape(expand('%')))
endfunction

command! -bang -nargs=? -complete=dir Files
\ call fzf#vim#files(<q-args>, {'source': s:list_cmd(),
\                               'options': '--tiebreak=index'}, <bang>0)


" Open new file adjacent to current file
nnoremap <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" No arrow keys --- force yourself to use the home row
nnoremap <up> <nop>
nnoremap <down> <nop>
" inoremap <up> <nop>
" inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Left and right can switch buffers
nnoremap <left> :bp<CR>
nnoremap <right> :bn<CR>

" <leader><leader> toggles between buffers
" nnoremap <leader><leader> <c-^> SAME THING
nnoremap \\ :b#<CR>
nnoremap <leader>b :b#<CR>
nnoremap \b :b#<CR>

" Move by line
nnoremap j gj
nnoremap k gk

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" use <Tab> as trigger keys
" imap <Tab> <Plug>(completion_smart_tab)
" imap <S-Tab> <Plug>(completion_smart_s_tab)

" Enable type inlay hints
autocmd CursorHold,CursorHoldI *.rs :lua require'lsp_extensions'.inlay_hints{ only_current_line = true }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" <leader><leader> toggles between buffers
nnoremap <leader><leader> <c-^>

" <leader>, shows/hides hidden characters
nnoremap <leader>, :set invlist<cr>

" <leader>q shows stats
nnoremap <leader>q g<c-g>

" Keymap for replacing up to next _ or -
" noremap <leader>m ct_

" I can type :help on my own, thanks.
map <F1> <Esc>
imap <F1> <Esc>


" =============================================================================
" # Autocommands
" =============================================================================

" Prevent accidental writes to buffers that shouldn't be edited
autocmd BufRead *.orig set readonly
autocmd BufRead *.pacnew set readonly

" Leave paste mode when leaving insert mode
autocmd InsertLeave * set nopaste

" Jump to last edit position on opening file
if has("autocmd")
  " https://stackoverflow.com/questions/31449496/vim-ignore-specifc-file-in-autocommand
  au BufReadPost * if expand('%:p') !~# '\m/\.git/' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Follow Rust code style rules
au Filetype rust source ~/.config/nvim/scripts/spacetab.vim
au Filetype rust set colorcolumn=100

"javascript
au Filetype javascript source ~/.config/nvim/scripts/spacetab.vim

" Help filetype detection
autocmd BufRead *.plot set filetype=gnuplot
autocmd BufRead *.md set filetype=markdown
autocmd BufRead *.lds set filetype=ld
autocmd BufRead *.tex set filetype=tex
autocmd BufRead *.trm set filetype=c
autocmd BufRead *.xlsx.axlsx set filetype=ruby

" Script plugins
autocmd Filetype html,xml,xsl,php source ~/.config/nvim/scripts/closetag.vim

" =============================================================================
" # Footer
" =============================================================================

" nvim
if has('nvim')
	runtime! plugin/python_setup.vim
endif

if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif


"haskell
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords
let g:haskell_classic_highlighting = 1


highlight LspDiagnosticsVirtualTextError guifg=Red ctermfg=Red
highlight LspDiagnosticsVirtualTextWarning guifg=Yellow ctermfg=Yellow
highlight LspDiagnosticsSignError guifg=BrightRed

highlight LspDiagnosticsDefaultError guifg=BrightRed
highlight LspDiagnosticsDefaultWarning guifg=BrightYellow

" highlight LspDiagnosticsDefaultError guifg=BrightRed

"find visually selected word in file // then n normally
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>


nmap \w :w<CR>
noremap Y y$

nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv


"Arduino
autocmd FileType arduino nnoremap <F9> :wa<Enter> :! arduinoCompileEditor %<Enter>
autocmd FileType arduino nnoremap <F10> :wa<Enter> :! arduinoUploadEditor %<Enter>

"Node
autocmd FileType javascript nnoremap <F10> :wa<Enter> :! npm run app<Enter>
autocmd FileType javascript nnoremap <F8> :BraceyReload <Enter>
" autocmd FileType javascript nnoremap <F9> :wa<Enter> :! node %<Enter>
autocmd FileType javascript nnoremap <F9> :w<Enter> :! node %<Enter>
autocmd FileType javascript nmap \p oconsole.log('')<Esc>$F'i
autocmd FileType javascript nmap \P Oconsole.log('')<Esc>$F'i

"Python
autocmd FileType python nnoremap <F9> :wa<Enter> :! python %<Enter>

"Rust
autocmd FileType rust nnoremap <F9> :wa<Enter> :! cargo run<Enter>
autocmd FileType rust nmap \p oprintln!("");<Esc>$F"i
autocmd FileType rust nmap \P Oprintln!("");<Esc>$F"i
autocmd FileType rust nmap \P Oprintln!("");<Esc>$F"i

"Vim
autocmd FileType vim nnoremap <F9> :wa<Enter> :source %<Enter>

"Bash
autocmd FileType bash nnoremap <F9> :wa !bash % <Enter>

"C++
autocmd FileType cpp nnoremap <F9> :w <Enter> :call system('./run') <Enter>
" autocmd FileType cpp nnoremap <F10> :wa <Enter> :call system('./run') <Enter>

"HTML
"include html template on buffer start
autocmd BufNewFile *.html 0r ~/.vim/templates/skeleton.html
autocmd BufRead,BufNewFile *.htm,*.html setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType html nnoremap <F10> :w<Enter> :Bracey <Enter><Enter>
autocmd FileType html nnoremap <F9> :BraceyReload <Enter>
autocmd FileType html nnoremap <F5> :BraceyReload <Enter>

""VimWiki
"autocmd FileType wiki nnoremap <F9> :Vimwiki2HTML <Enter>


"Colorschemes
" autocmd BufEnter *.html,*.css,*.js colorscheme codedark

" autocmd FileType haskell nnoremap <F9> :w<Enter> :! ~/run_haskell.sh %<Enter>
" au Filetype haskell source ~/.config/nvim/scripts/spacetab2.vim


" Toggle background transparency
let t:isTransparent = 0
function! Toggle_transparent_background()
  if t:isTransparent == 0
    hi Normal guibg=#111111 ctermbg=black
    set background=dark
    let t:isTransparent = 1
  else
    hi Normal guibg=NONE ctermbg=NONE
    let t:isTransparent = 0
  endif
endfunction
nnoremap <silent> <F1> :call Toggle_transparent_background()<CR>  

nnoremap <silent> <F11>     :CocCommand fzf-preview.ProjectFiles <CR>
" lua require('formatter').setup(...)
" Provided by setup function
" nnoremap <silent> <leader>f :Format<CR>

autocmd BufEnter * silent! lcd %:p:h
set autochdir
set viewoptions-=curdir

" let g:airline_theme = 'codedark'
"Change colorscheme here
colorscheme codedark
" colorscheme gruvbox
" colorscheme sonokai
" colorscheme gruvbox
" colorscheme base16-gruvbox-dark-hard
autocmd FileType c setlocal shiftwidth=2 tabstop=2
autocmd FileType cpp setlocal shiftwidth=2 tabstop=2
autocmd FileType *.ino setlocal shiftwidth=2 tabstop=2

" colorscheme badwolf
" highlight EndOfBuffer ctermfg=241 ctermbg=233 guifg=#666462 guibg=#1c1b1a
" highlight LineNr ctermfg=241 ctermbg=233 guifg=#666462 guibg=#1c1b1a

" highlight Cursor ctermfg=White ctermbg=Yellow cterm=bold guifg=white guibg=yellow gui=bold

nnoremap <leader>s <cmd>lua require('searchbox').incsearch()<CR>
vnoremap <leader>s <Esc><cmd>lua require("searchbox").incsearch({visual_mode = true})<CR>
nnoremap <leader>r <cmd>lua require("searchbox").replace({exact = false})<CR>
vnoremap <leader>r <cmd>lua require("searchbox").replace({exact = false, visual_mode = true})<CR>
