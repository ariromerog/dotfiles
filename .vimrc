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
set statusline=0
set ignorecase

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
  Plug 'ryanoasis/vim-devicons'
  Plug 'morhetz/gruvbox'
	Plug 'catppuccin/vim', { 'as': 'catppuccin' }
	Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'jiangmiao/auto-pairs'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-commentary'
  Plug 'yaegassy/coc-ruff', {'do': 'yarn install --frozen-lockfile'}
call plug#end()

" ------------------------------------------------------------------------------
" Theme
" ------------------------------------------------------------------------------
syntax on
set termguicolors
set cursorline
set background=dark
colorscheme catppuccin_macchiato

" ------------------------------------------------------------------------------
" Key bindings
" ------------------------------------------------------------------------------

nmap <leader>e :NERDTreeToggle<CR>
nmap <leader>t :term<CR>
nmap <leader><space> :FZF<CR>
nmap <leader>wq :q<CR>
nmap <leader>ws :split<CR>
nmap <leader>wv :vsplit<CR>
nmap <leader>qq :qa<CR>
nmap <leader>k :wincmd k<CR>
nmap <leader>j :wincmd j<CR>
nmap <leader>h :wincmd h<CR>
nmap <leader>l :wincmd l<CR>
nmap <leader>QQ :qa!<CR>
nmap L :bNext<CR>
nmap H :bprevious<CR>
nmap X :bdelete<CR>
map <C-s> :w<CR>

vnoremap > >gv
vnoremap < <gv
vnoremap <C-c> "+y<CR>

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" ------------------------------------------------------------------------------
" Airline
" ------------------------------------------------------------------------------
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
" let g:airline_theme='gruvbox'

" ------------------------------------------------------------------------------
"  NerdTree
" ------------------------------------------------------------------------------
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

let g:NERDTreeQuitOnOpen = 1

" ------------------------------------------------------------------------------
"  CoC
" ------------------------------------------------------------------------------
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

let g:coc_global_extensions = [
      \ 'coc-diagnostic',
      \ 'coc-json',
      \ 'coc-tsserver',
      \ 'coc-eslint',
      \ 'coc-css',
      \ 'coc-python',
      \ ]




