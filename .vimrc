let mapleader = " "

" ------------------------------------------------------------------------------
" general options
" ------------------------------------------------------------------------------
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
" Use new regular expression engine
set re=0

let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" ------------------------------------------------------------------------------
" Set to auto read when a file is changed from the outside
" ------------------------------------------------------------------------------
set autoread
au FocusGained,BufEnter * checktime
" ------------------------------------------------------------------------------
" plugins
" ------------------------------------------------------------------------------

call plug#begin('~/.vim/plugged')
  Plug 'preservim/nerdtree'
  Plug 'preservim/nerdcommenter'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'honza/vim-snippets'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-commentary'
  Plug 'Vimjas/vim-python-pep8-indent'
  Plug 'jiangmiao/auto-pairs'
  Plug 'alvan/vim-closetag'
  Plug 'sonph/onehalf', {'rtp': 'vim/'}
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'vim-ruby/vim-ruby'
  Plug 'arcticicestudio/nord-vim'
  Plug 'navarasu/onedark.nvim'
  Plug 'ryanoasis/vim-devicons'
  Plug 'jacoborus/tender.vim'
  Plug 'lervag/vimtex'
  Plug 'christoomey/vim-tmux-navigator'
  "Plug 'jabirali/vim-tmux-yank'
"  Plug 'jnurmine/Zenburn'
"  Plug 'altercation/vim-colors-solarized'
"  Plug 'maxmellon/vim-jsx-pretty'
"	 Plug 'HerringtonDarkholme/yats.vim'
call plug#end()

" ------------------------------------------------------------------------------
" Theme
" ------------------------------------------------------------------------------

syntax on
set t_Co=256
set cursorline
colorscheme tender
let g:airline_theme='tender'
hi comment cterm = none
" lightline
let g:lightline = { 'colorscheme': 'onehalfdark' }

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" ------------------------------------------------------------------------------
" Airline
" ------------------------------------------------------------------------------
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

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
"  NerdTree
" ------------------------------------------------------------------------------

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Open the existing NERDTree on each new tab.
" autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

let g:NERDTreeQuitOnOpen = 1

" ------------------------------------------------------------------------------
" Closetag
" ------------------------------------------------------------------------------

" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.erb'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.erb'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'

" ------------------------------------------------------------------------------
"  CoC
" ------------------------------------------------------------------------------
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" ------------------------------------------------------------------------------
" backspace
" ------------------------------------------------------------------------------
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" let g:coc_disable_startup_warning = 1
" let g:coc_global_extensions = ['coc-solargraph']

" ------------------------------------------------------------------------------
" atajos
" ------------------------------------------------------------------------------
" Fuzzy Finder
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <C-g> :GFiles<CR>
nnoremap <silent> <Leader>m :Windows<CR>
nnoremap <silent> <Leader>f :Rg<CR>
nnoremap <silent> <Leader>/ :BLines<CR>
nnoremap <silent> <Leader>' :Marks<CR>
nnoremap <silent> <Leader>g :Commits<CR>
nnoremap <silent> <Leader>H :Helptags<CR>
nnoremap <silent> <Leader>hh :History<CR>
nnoremap <silent> <Leader>h: :History:<CR>
nnoremap <silent> <Leader>h/ :History/<CR> 

" NerdTree
nnoremap <leader>e :NERDTreeToggle<CR>
nnoremap <leader>t :term<CR>

" cambiar entre paneles
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" guardar / salir
nmap <silent><nowait><Leader>w :w<CR>
nmap <silent><nowait><Leader>Q :q<CR>

" teclas f
map <F7> gg=G<C-o><C-o> " ordenar todo el archivo
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>:retab<CR>

" visual mode
vmap D y'>p

" terminal
tnoremap <Esc><Esc> <C-\><C-n>

"keep visual mode after indent
vnoremap > >gv
vnoremap < <gv

" buffwer nav
nnoremap <leader>n :bNext<CR>
nnoremap <leader>b :bprevious<CR>
nnoremap <leader>q :bdelete<CR>

" ctrl c copies to clipboard
" vnoremap <C-C> :w !xclip -i -sel c<CR><CR>

vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>
vnoremap <c-f> y<ESC>/<c-r>"<CR>

