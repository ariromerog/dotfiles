let mapleader = " "

" ------------------------------------------------------------------------------
" general options
" ------------------------------------------------------------------------------
set autoread
set history=500
set nobackup
set nowritebackup
set noswapfile
set number
set numberwidth=5
set clipboard=unnamed
set showcmd
set ruler
set encoding=utf-8
set showmatch
set splitbelow
set splitright
set pastetoggle=<F2>
set nomodeline
set wildmenu
set mouse=a
set hidden
set re=0

let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

au FocusGained,BufEnter * checktime

" ------------------------------------------------------------------------------
" plugins
" ------------------------------------------------------------------------------
call plug#begin()
	Plug 'tpope/vim-sensible'
	Plug 'catppuccin/vim', { 'as': 'catppuccin' }
	Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
call plug#end()

" ------------------------------------------------------------------------------
" Theme
" ------------------------------------------------------------------------------
syntax on
set termguicolors
set cursorline
colorscheme catppuccin_frappe

" ------------------------------------------------------------------------------
" Key bindings
" ------------------------------------------------------------------------------

nnoremap <leader>e :NERDTreeToggle<CR>
nnoremap <leader>t :term<CR>

" cambiar entre paneles
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l



