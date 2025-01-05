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
" auto indentacion
" ------------------------------------------------------------------------------

filetype plugin indent on
set si "Smart indent
set ai "Auto indent
set autoindent
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2
set softtabstop=2
set lbr
set tw=500
set wrap "Wrap lines

" ------------------------------------------------------------------------------
" plugins
" ------------------------------------------------------------------------------
call plug#begin()
	Plug 'catppuccin/vim', { 'as': 'catppuccin' }
	Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
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

nmap <leader>e :NERDTreeToggle<CR>
nmap <leader>t :term<CR>
nmap <leader>f :FZF<CR>
nmap <leader>w :w<CR>
nmap <leader>wq :q<CR>
nmap <leader>ws :split<CR>
nmap <leader>wv :vsplit<CR>
nmap <leader>qq :qa<CR>
nmap <leader>bn :bNext<CR>
nmap <leader>bp :bprevious<CR>
nmap <leader>bd :bdelete<CR>
nmap <leader>k :wincmd k<CR>
nmap <leader>j :wincmd j<CR>
nmap <leader>h :wincmd h<CR>
nmap <leader>l :wincmd l<CR>

vnoremap > >gv
vnoremap < <gv
