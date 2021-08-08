" Plugins will be downloaded under the specified directory.
"call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
call plug#begin('~/.vim/plugged')
" Declare the list of plugins.
" Plug 'vim-python/python-syntax'
Plug 'tpope/vim-sensible'
Plug 'junegunn/seoul256.vim'
Plug 'morhetz/gruvbox' 
Plug 'chriskempson/base16-vim' 
Plug 'uiiaoo/java-syntax.vim'
Plug 'vim-scripts/vim-javacomplete2'
Plug 'tpope/vim-commentary'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mbbill/undotree'
Plug 'itchyny/lightline.vim'
Plug 'honza/vim-snippets'
Plug 'machakann/vim-highlightedyank'
Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tomasr/molokai'
Plug 'tpope/vim-surround'
Plug 'lervag/vimtex'
Plug 'rust-lang/rust.vim'
" Plug 'ryanoasis/vim-devicons'
" List ends here. Plugins become visible to Vim after this call.
call plug#end()

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" let g:UltiSnipsExpandTrigger="<tab>"
" " list all snippets for current filetype
" let g:UltiSnipsListSnippets="<c-l>"

"Latex settings
" settings for sumatraPDF
let g:vimtex_view_general_viewer = 'zathura'
let g:vimtex_view_general_options
    \ = '-reuse-instance -forward-search @tex @line @pdf'
let g:vimtex_view_general_options_latexmk = '-reuse-instance'




autocmd CursorHold * silent call CocActionAsync('highlight')
" nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

if &filetype ==# 'python' || &filetype ==# 'python3'
	nnoremap  <F3> <Esc>:w<CR>:!clear;python %<CR>
	inoremap  <F3> <Esc>:w<CR>:!clear;python %<CR>
endif

nnoremap <Leader><space> :noh<CR>

" au VimEnter * !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
" au VimLeave * !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'

" esc in insert mode
inoremap kj <esc>

" esc in command mode
cnoremap kj <C-C>

" if &filetype ==# 'cpp'
" 	nnoremap  <C-F5> :w|!compilCpp %
" endif

" nnoremap  <C-F5> :w|!python3 %



syntax on
syntax enable
filetype plugin indent on


highlight HighlightedyankRegion cterm=reverse gui=reverse

set autoindent 
set tabstop=4
set number
set nobackup
set nowritebackup
set nocompatible
set ignorecase
set smartcase
set shortmess+=I
set number
set relativenumber
set laststatus=2
set backspace=indent,eol,start
set hidden
set incsearch
set noerrorbells visualbell t_vb=
set mouse+=a "enable mouse support
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set noerrorbells visualbell t_vb=
set shellcmdflag=-ict
let $BASH_ENV="~/.vim/vim_bash"


"set global variables here

let $ZSH_ENV="~/.vim/vim_bash"

" Quick-save
nmap <leader>w :w<CR>

if &filetype ==# 'rs'
	nmap <leader>r :w !compileRust %<CR>
endif

let g:coc_global_extensions = [
      \ 'coc-pyright']
	" ,
      " \ 'coc-html',
      " \ 'coc-css',
      " \ 'coc-python',
      " \ 'coc-phpls',
      " \ 'coc-yaml',
      " \ 'coc-json',
      " \ 'coc-vimlsp',
      " \ 'coc-emmet',
      " \ 'coc-tag',
      " \ ]

let g:python_highlight_all = 1

if has('python3')
    let g:gundo_prefer_python3 = 1
endif



"let g:gruvbox_colorscheme ='base16-gruvbox-dark-hard'
"set bg=dark
colorscheme gruvbox
" let base16colorspace=256
"set termguicolors
" colorscheme base16-monokai
" colorscheme base16-default-dark
" colorscheme base16-default-dark
set background=dark

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

" keyboard mappings here
" -------------------------------------
nnoremap <F5> :UndotreeToggle<CR>

" nnoremap <Left> :echo "No left for you!"<CR>
" vnoremap <Left> :<C-u>echo "No left for you!"<CR>
" inoremap <Left> <C-o>:echo "No left for you!"<CR>

" nnoremap <Right> :echo "No Right for you!"<CR>
" vnoremap <Right> :<C-u>echo "No Right for you!"<CR>
" inoremap <Right> <C-o>:echo "No Right for you!"<CR>

" nnoremap <Up> :echo "No Up for you!"<CR>
" vnoremap <Up> :<C-u>echo "No Up for you!"<CR>
" inoremap <Up> <C-o>:echo "No Up for you!"<CR>

" nnoremap <Down> :echo "No Down for you!"<CR>
" vnoremap <Down> :<C-u>echo "No Down for you!"<CR>
" inoremap <Down> <C-o>:echo "No Down for you!"<CR>
 " 'Q' in normal mode enters Ex mode. You almost never want this.
nmap Q <Nop>
nmap gccj <Nop>
nmap gcck <Nop>


"find visually selected word in file // then n normally
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

"make comments using ctrl+/
nmap <C-_> gcc 
inoremap <C-_> gcc 
vnoremap <C-_> gcc 
nnoremap <C-_> gcc 


" copy to clipboard with ctrl+c
map <C-c> "+y
map <C-a> ggVG

nmap <C-j> <ESC>
inoremap <C-j> <ESC>
vnoremap <C-j> <ESC>
nnoremap <C-j> <ESC>

" nmap kj <ESC>
" inoremap kj <ESC>
" vnoremap kj <ESC>
" nnoremap kj <ESC>

" Basic configs that make my life easier
" -------------------------------------

if v:progname =~? "evim"
  finish
endif

"source $VIMRUNTIME/defaults.vim
if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
augroup END

" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

"to keep vim and terminal in sync
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256          " Remove this line if not necessary
  source ~/.vimrc_background
endif
