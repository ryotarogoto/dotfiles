syntax on

"----------------------------------------------------
" neobundle.vim
"----------------------------------------------------
set nocompatible
filetype plugin indent off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
  call neobundle#rc(expand('~/.vim/bundle/'))
endif

NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'ujihisa/unite-locate'
NeoBundle 'violetyk/cake.vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'taglist.vim'
NeoBundle 'http://github.com/mattn/emmet-vim.git'
NeoBundle 'ref.vim'
NeoBundle 'The-NERD-tree'
NeoBundle 'The-NERD-Commenter'
NeoBundle 'fugitive.vim'
NeoBundle 'TwitVim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'thinca/vim-localrc'
NeoBundle 'dbext.vim'
NeoBundle 'rails.vim'
NeoBundle 'Gist.vim'
NeoBundle 'motemen/hatena-vim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'mattn/unite-advent_calendar'
NeoBundle 'open-browser.vim'
NeoBundle 'ctrlp.vim'
NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle 'chrisbra/csv.vim'
NeoBundle 'vim-perl/vim-perl'
NeoBundle 'mitechie/pyflakes-pathogen'
NeoBundle 'nathanaelkane/vim-indent-guides'

filetype plugin indent on

function! InitPython()
  setlocal shiftwidth=4
  setlocal tabstop=8
  setlocal softtabstop=4
  setlocal expandtab

endfunction
autocmd BufEnter * if &filetype == "python" | call InitPython() | endif

" Search {{{
set ignorecase
set smartcase

set incsearch
set nohlsearch
"set hlsearch

set wrapscan
" }}}

" File {{{
augroup filetypedetect
    autocmd! BufNewFile,BufRead *.t setf perl
    autocmd! BufNewFile,BufRead *.psgi setf perl
    autocmd! BufNewFile,BufRead *.tt setf tt2html
augroup END
" }}}

" Edit {{{
set autoindent
set cindent
set smartindent

set tabstop=2
set shiftwidth=2
set expandtab
set smarttab
set textwidth=0
" folding
set foldenable
set foldmethod=marker

set showmatch
set matchtime=3
set list
set listchars=tab:>-,trail:-,nbsp:%,extends:>,precedes:<
set backspace=indent,eol,start
set textwidth=0
set colorcolumn=80
set wrap

set undolevels=2000

" backup
set backup
set backupdir=~/.vim.backup
set directory=~/.vim.swap

" 改行時にコメントしない
autocmd FileType * setlocal formatoptions-=ro

" Colorscheme {{{
set t_Co=256
set background=light

syntax enable

hi CursorLine cterm=underline ctermbg=None
hi TabLineSel ctermfg=White
hi TabLineFill ctermbg=White
hi TabLine ctermbg=White
" }}}

" Insert mode {{{
inoremap <C-d> <Del>

" ESC
nnoremap <F1> :NERDTreeToggle<CR>
nnoremap <F2> :NERDTreeToggle<CR>
" }}}

" unite.vim
"入力モードで開始する
let g:unite_enable_start_insert=0
"バッファ一覧
noremap <C-U><C-B> :Unite buffer<CR>
noremap <C-U><C-F> :UniteWithBufferDir -buffer-name=files file<CR>
noremap <C-U><C-R> :Unite file_mru<CR>
noremap <C-U><C-Y> :Unite -buffer-name=refister refister<CR>
noremap <C-U><C-U> :Unite buffer file_mru<CR>
noremap <C-U><C-A> :Unite UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
au FileType unite nnoremap <silent><buffer><ESC><ESC> :q<CR>
au FileType unite inoremap <silent><buffer><ESC><ESC><ESC>:q<CR>
"Unite-grep
nnoremap <silent>,ug :Unite grep:%:-iHRn<CR>
